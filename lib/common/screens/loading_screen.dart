import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold(
      body: Center(
        child: CircularProgressIndicator(color: AppColors.green),
      ),
    );
  }
}
