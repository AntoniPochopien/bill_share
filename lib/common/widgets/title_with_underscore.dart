import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:flutter/widgets.dart';

class TitleWithUnderscore extends StatelessWidget {
  final String title;
  final String? description;
  const TitleWithUnderscore({super.key, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    final textStyle = Font.h2DarkSemiBold;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle,
        ),
        SizedBox(height: 3),
        LayoutBuilder(
          builder: (context, constraints) {
            final textPainter = TextPainter(
              text: TextSpan(text: title, style: textStyle),
              maxLines: 1,
              textScaler: MediaQuery.of(context).textScaler,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
            )..layout();
            return Column(
              children: [
                Container(
                  width: textPainter.width,
                  height: 1,
                  color: AppColors.grey,
                ),
              ],
            );
          },
        ),
        if (description != null) SizedBox(height: 16),
        if (description != null) Text(description!, style: Font.h4Grey)
      ],
    );
  }
}
