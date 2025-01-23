part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const PaymentState._();
  const factory PaymentState({
    @Default(false) bool pending,
    @Default(false) bool avaliable,
    @Default([]) List<ProductDetails> products,
    @Default([]) List<PurchaseDetails> purchases,
    Failure? error,
  }) = _PaymentState;

  get isPremium => purchases.any((element) => element.productID == 'pl.byteitright.premium');

}
