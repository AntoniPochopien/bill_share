import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/utils/helpers.dart';
import 'package:bill_share/common/utils/image_url_generator.dart';
import 'package:bill_share/common/widgets/profile_image.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ExpenseBubble extends StatelessWidget {
  final Expense expense;
  const ExpenseBubble({super.key, required this.expense});

  bool _isMe() => expense.creator.id == getIt<InjectableUser>().currentUser.id;

  Color _findBubbleColor() {
    final userId = getIt<InjectableUser>().currentUser.id;
    final beneficiariesContainsUser = expense.beneficiaries
        .any((element) => element.beneficiary.id == userId);
    final userIsPayer = expense.payer.id == userId;
    if (userIsPayer) {
      return AppColors.green;
    }
    if (beneficiariesContainsUser) {
      return AppColors.errorRed;
    } else {
      return AppColors.black.withValues(alpha: 0.25);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        !_isMe()
            ? Row(children: [
                ProfileImage(
                  size: 47,
                  imageUrl: ImageUrlGenerator.generatePublicImageUrl(
                      expense.creator.imageUrl),
                ),
                SizedBox(width: 11),
              ])
            : SizedBox(width: 47),
        Expanded(
          child: Column(
            children: [
              SizedBox(height: 15),
              Text(
                Helpers.dateFormatter(expense.createdAt),
                style: Font.h4Grey,
              ),
              SizedBox(height: 4),
              Container(
                decoration: BoxDecoration(
                    color: _findBubbleColor(),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          expense.title,
                          style: Font.h1BrightkSemiBold,
                        ),
                        Text(
                          '${T(context).total}:',
                          style: Font.h4Bright,
                        ),
                        Text(
                          '${expense.amount}\$',
                          style: Font.h1BrightMedium,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.person, color: AppColors.white),
                              SizedBox(width: 4),
                              Text(
                                expense.beneficiaries.length.toString(),
                                style: Font.h4Bright,
                              ),
                            ])
                      ]),
                ),
              ),
            ],
          ),
        ),
        _isMe()
            ? Row(children: [
                SizedBox(width: 11),
                ProfileImage(
                  size: 47,
                  imageUrl: ImageUrlGenerator.generatePublicImageUrl(
                      expense.creator.imageUrl),
                ),
              ])
            : SizedBox(width: 47),
      ],
    );
  }
}
