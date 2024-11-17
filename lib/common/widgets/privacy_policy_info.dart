import 'package:flutter/material.dart';
import 'package:bill_share/constants/font.dart';

class PrivacyPolicyInfo extends StatelessWidget {
  const PrivacyPolicyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.5),
      child: Row(
        children: [
          Expanded(child: SizedBox()),
          Expanded(
            flex: 3,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'By signing in, you agree to '),
                  TextSpan(text: 'Privacy Policy', style: Font.h5Green),
                  TextSpan(text: ' and '),
                  TextSpan(text: 'Terms of Use', style: Font.h5Green),
                  TextSpan(text: '.'),
                ],
                style: Font.h5Grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
