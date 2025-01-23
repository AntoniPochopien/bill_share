import 'dart:async';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/constants/store_products.dart';
import 'package:bill_share/payments/domain/i_payments_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final IPaymentsRepository iPaymentsRepository;
  PaymentCubit({
    required this.iPaymentsRepository,
  }) : super(PaymentState());

  late final bool _isStoreAvaliable;
  StreamSubscription<List<PurchaseDetails>>? _purchasesSubscription;

  void init() async {
    _isStoreAvaliable = await iPaymentsRepository.isStoreAvaliable();
    if (_isStoreAvaliable) {
      final results = await Future.wait([
        iPaymentsRepository.getProducts(StoreProducts.storeProductsIds),
        iPaymentsRepository.getPurchasesStream(),
      ]);
      final productsResult =
          results[0] as Either<Failure, List<ProductDetails>>;

      final streamResult =
          results[1] as Either<Failure, Stream<List<PurchaseDetails>>>;

      productsResult.fold(
          (productsFailure) => emit(state.copyWith(error: productsFailure)),
          (products) => streamResult.fold(
                (streamFalure) => emit(state.copyWith(error: streamFalure)),
                (stream) {
                  emit(state.copyWith(products: products));
                  _listenForPurchases(stream);
                },
              ));
    }
  }

  void _listenForPurchases(Stream<List<PurchaseDetails>> purchasesStream) {
    _purchasesSubscription?.cancel();
    _purchasesSubscription = purchasesStream.listen((event) {
      for (final element in event) {
        if (element.status == PurchaseStatus.pending) {
          //handle situation when user pressed button to start purchase, (on iOS it takes more time, android have almost immediately response) show some loading spinners
          emit(state.copyWith(pending: true, error: null));
        } else if (element.status == PurchaseStatus.error) {
          emit(state.copyWith(pending: false, error: Failure.unauthorized()));
        } else if (element.status == PurchaseStatus.canceled) {
          //handle situation when user canceled payment
          emit(state.copyWith(pending: false, error: null));
        } else if (element.status == PurchaseStatus.purchased ||
            element.status == PurchaseStatus.restored) {
          //if purchase or restored, make sure to give users what they payed for
          final currentPurchasesCopy =
              List<PurchaseDetails>.from(state.purchases);
          emit(state.copyWith(purchases: currentPurchasesCopy, error: null));
          if (element.status == PurchaseStatus.purchased) {
            iPaymentsRepository.completePurchase(element);
          }
          emit(
            state.copyWith(pending: false, error: null),
          );
        }
      }
    });
  }

  void buyProduct(ProductDetails product) async {
    emit(state.copyWith(pending: true));
    final result = await iPaymentsRepository.buyProduct(product);
    result.fold((l) => emit(state.copyWith(error: l)), (_) {});
  }

  @override
  Future<void> close() {
    _purchasesSubscription?.cancel();
    return super.close();
  }
}
