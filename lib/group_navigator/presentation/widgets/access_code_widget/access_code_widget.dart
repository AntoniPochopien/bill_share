import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/group_navigator/presentation/widgets/access_code_widget/access_code_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccessCodeWidget extends StatefulWidget {
  const AccessCodeWidget({super.key});

  @override
  State<AccessCodeWidget> createState() => _AccessCodeWidgetState();
}

class _AccessCodeWidgetState extends State<AccessCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(children: [
        TitleWithUnderscore(
          title: 'Access code',
          description: 'Give this code, someone who wants to join the group',
        ),
        GestureDetector(
          onLongPress: () async {
            HapticFeedback.mediumImpact();
            await Clipboard.setData(ClipboardData(text: '6AB 8P1'));
          },
          child: Text(
            '6AB 8P1',
            style: Font.h1DarkSemiBold,
          ),
        ),
        SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          AccessCodeButton(
            iconData: Icons.refresh,
            isLoading: false,
            onTap: () {},
          ),
          SizedBox(width: 16),
          AccessCodeButton(
            iconData: Icons.lock_outline,
            isLoading: false,
            onTap: () {},
          ),
        ])
      ]),
    );
  }
}
