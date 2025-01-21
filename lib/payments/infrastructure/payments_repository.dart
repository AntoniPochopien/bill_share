import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/payments/domain/i_payments_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PaymentsRepository implements IPaymentsRepository {
  final _iap = InAppPurchase.instance;

  @override
  Future<bool> isStoreAvaliable() async {
    try {
      return await _iap.isAvailable();
    } catch (e) {
      log('isStoreAvaliable unexpected error: $e');
      return false;
    }
  }

  @override
  Future<Either<Failure, Stream<List<PurchaseDetails>>>>
      getPurchasesStream() async {
    try {
      return right(_iap.purchaseStream);
    } catch (e) {
      log('getPurchasesStream unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, Unit>> buyProduct(
      ProductDetails productDetails) async {
    try {
      final purchaseParam = PurchaseParam(productDetails: productDetails);
      final response =
          await _iap.buyNonConsumable(purchaseParam: purchaseParam);
      if (response) {
        return right(unit);
      } else {
        return left(Failure.unexpected());
      }
    } catch (e) {
      log('buyProduct unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, List<ProductDetails>>> getProducts(
      Set<String> productIds) async {
    try {
      final response = await _iap.queryProductDetails(productIds);
      return right(response.productDetails);
    } catch (e) {
      log('getProducts unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<void> completePurchase(PurchaseDetails purchaseDetails) async =>
      _iap.completePurchase(purchaseDetails);
}
