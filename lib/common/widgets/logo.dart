import 'package:flutter/material.dart';
import 'package:bill_share/constants/assets.dart';

class Logo extends StatelessWidget {
  final double size;
  const Logo({super.key, this.size = 42});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(Assets.logo));
  }
}