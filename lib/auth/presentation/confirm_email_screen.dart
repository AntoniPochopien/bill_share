import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/wrappers/billshare_scaffold.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConfirmEmailScreen extends StatelessWidget {
  const ConfirmEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BillshareScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.green, AppColors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(
              Icons.email_outlined,
              color: Colors.white,
              size: 48,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Sprawdź swoją skrzynkę mailową',
            style: Font.h2DarkSemiBold.copyWith(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Wysłaliśmy Ci wiadomość z linkiem do potwierdzenia adresu e-mail. Po potwierdzeniu możesz się zalogować.',
            style: Font.h4Dark.copyWith(height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Button(
            text: 'Wróć do logowania',
            onPressed: () => context.replaceRoute(const AuthRoute()),
          ),
        ],
      ),
    );
  }
}
