import 'package:bill_share/common/utils/helpers.dart';
import 'package:bill_share/common/widgets/profile_image.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:flutter/material.dart';

class ExpenseBubble extends StatelessWidget {
  final Expense expense;
  const ExpenseBubble({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ProfileImage(
          size: 47,
        ),
        SizedBox(width: 11),
        Expanded(
          child: Column(
            children: [
              Text(
                Helpers.dateFormatter(expense.createdAt),
                style: Font.h4Grey,
              ),
              SizedBox(height: 4),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.green,
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
                          'Total:',
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
        SizedBox(width: 47),
      ],
    );
  }
}
