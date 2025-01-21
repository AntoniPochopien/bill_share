import 'package:bill_share/common/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

abstract class IPaymentsRepository {
  Future<bool> isStoreAvaliable();
  Future<Either<Failure, Stream<List<PurchaseDetails>>>> getPurchasesStream();
  Future<Either<Failure, List<ProductDetails>>> getProducts(
      Set<String> productIds);
  Future<Either<Failure, Unit>> buyProduct(ProductDetails productDetail);
  Future<void> completePurchase(PurchaseDetails purchaseDetails);
}
