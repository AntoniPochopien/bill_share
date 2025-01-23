import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/constants/assets.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/payments/application/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class PremiumPurchaseDialog extends StatelessWidget {
  final double price;
  final String currency;
  final Function onBuy;
  const PremiumPurchaseDialog({
    super.key,
    required this.price,
    required this.currency,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleWithUnderscore(
                title: T(context).go_premium,
                description: T(context).buy_premium_to_create,
              ),
              SizedBox(height: 16),
              Stack(children: [
                Button(
                  text: '${T(context).buy} $price $currency',
                  isLoading: state.pending,
                  onPressed: () => onBuy(),
                ),
                Positioned(
                  right: 3,
                  top: 8,
                  child: Lottie.asset(Assets.premiumAnimation,
                      width: 40, height: 40),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
