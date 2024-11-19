import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:flutter/widgets.dart';

class ModalSheetStructure extends StatelessWidget {
  final String title;
  final String? description;
  final void Function(bool, Object?)? onPopInvokedWithResult;
  final Widget body;
  const ModalSheetStructure({
    super.key,
    required this.title,
    required this.body,
    this.description,
    this.onPopInvokedWithResult,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IgnorePointer(
                    child: TitleWithUnderscore(
                      title: title,
                      description: description,
                    ),
                  ),
                  SizedBox(height: 11.5),
                  body,
                ])),
      ),
    );
  }
}
