import 'package:flutter/material.dart';
import 'package:bill_share/constants/app_colors.dart';

class Font {
  //font family
  static const _basicFontFamily = 'Poppins';

  //sizes
  static const _h1 = 32.0;
  static const _h2 = 24.0;
  static const _h4 = 14.0;
  static const _h5 = 12.0;

  //dark
  static const _baseDark = TextStyle(fontFamily: _basicFontFamily, color: AppColors.black);

  static final h1Dark = _baseDark.copyWith(fontSize: _h1);
  static final h2Dark = _baseDark.copyWith(fontSize: _h2);
  static final h4Dark = _baseDark.copyWith(fontSize: _h4);
  static final h5Dark = _baseDark.copyWith(fontSize: _h5);

  //dark medium
  static final h1DarkMedium =
      _baseDark.copyWith(fontSize: _h1, fontWeight: FontWeight.w500);
  static final h2DarkMedium =
      _baseDark.copyWith(fontSize: _h2, fontWeight: FontWeight.w500);
  static final h4DarkMedium =
      _baseDark.copyWith(fontSize: _h4, fontWeight: FontWeight.w500);
  static final h5DarkMedium =
      _baseDark.copyWith(fontSize: _h5, fontWeight: FontWeight.w500);

  //dark semibold
  static final h1DarkSemiBold =
      _baseDark.copyWith(fontSize: _h1, fontWeight: FontWeight.w600);
  static final h2DarkSemiBold =
      _baseDark.copyWith(fontSize: _h2, fontWeight: FontWeight.w600);
  static final h4DarkSemiBold =
      _baseDark.copyWith(fontSize: _h4, fontWeight: FontWeight.w600);
  static final h5DarkSemiBold =
      _baseDark.copyWith(fontSize: _h5, fontWeight: FontWeight.w600);

  //dark bold
  static final h1DarkBold =
      _baseDark.copyWith(fontSize: _h1, fontWeight: FontWeight.bold);
  static final h2DarkBold =
      _baseDark.copyWith(fontSize: _h2, fontWeight: FontWeight.bold);
  static final h4DarkBold =
      _baseDark.copyWith(fontSize: _h4, fontWeight: FontWeight.bold);
  static final h5DarkBold =
      _baseDark.copyWith(fontSize: _h5, fontWeight: FontWeight.bold);

  //bright
  static const _baseBright =
      TextStyle(fontFamily: _basicFontFamily, color: AppColors.white);

  static final h1Bright = _baseBright.copyWith(fontSize: _h1);
  static final h2Bright = _baseBright.copyWith(fontSize: _h2);
  static final h4Bright = _baseBright.copyWith(fontSize: _h4);
  static final h5Bright = _baseBright.copyWith(fontSize: _h5);

  //bright bold
  static final h1BrightBold =
      _baseBright.copyWith(fontSize: _h1, fontWeight: FontWeight.bold);
  static final h2BrightBold =
      _baseBright.copyWith(fontSize: _h2, fontWeight: FontWeight.bold);
  static final h4BrightBold =
      _baseBright.copyWith(fontSize: _h4, fontWeight: FontWeight.bold);
  static final h5BrightBold =
      _baseBright.copyWith(fontSize: _h5, fontWeight: FontWeight.bold);

  //grey
  static const _baseGrey =
      TextStyle(fontFamily: _basicFontFamily, color: AppColors.grey);

  static final h1Grey = _baseGrey.copyWith(fontSize: _h1);
  static final h2Grey = _baseGrey.copyWith(fontSize: _h2);
  static final h4Grey = _baseGrey.copyWith(fontSize: _h4);
  static final h5Grey = _baseGrey.copyWith(fontSize: _h5);

  //grey bold
  static final h1GreyBold =
      _baseGrey.copyWith(fontSize: _h1, fontWeight: FontWeight.bold);
  static final h2GreyBold =
      _baseGrey.copyWith(fontSize: _h2, fontWeight: FontWeight.bold);
  static final h4GreyBold =
      _baseGrey.copyWith(fontSize: _h4, fontWeight: FontWeight.bold);
  static final h5GreyBold =
      _baseGrey.copyWith(fontSize: _h5, fontWeight: FontWeight.bold);

  //green
  static const _baseGreen =
      TextStyle(fontFamily: _basicFontFamily, color: AppColors.green);

  static final h1Green = _baseGreen.copyWith(fontSize: _h1);
  static final h2Green = _baseGreen.copyWith(fontSize: _h2);
  static final h4Green = _baseGreen.copyWith(fontSize: _h4);
  static final h5Green = _baseGreen.copyWith(fontSize: _h5);

  //green bold
  static final h1GreenBold =
      _baseGreen.copyWith(fontSize: _h1, fontWeight: FontWeight.bold);
  static final h2GreenBold =
      _baseGreen.copyWith(fontSize: _h2, fontWeight: FontWeight.bold);
  static final h4GreenBold =
      _baseGreen.copyWith(fontSize: _h4, fontWeight: FontWeight.bold);
  static final h5GreenBold =
      _baseGreen.copyWith(fontSize: _h5, fontWeight: FontWeight.bold);
}
