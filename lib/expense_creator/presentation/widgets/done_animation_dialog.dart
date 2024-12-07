import 'package:bill_share/constants/assets.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class DoneAnimationDialog extends StatefulWidget {
  final Function onDone;
  const DoneAnimationDialog({super.key, required this.onDone});

  @override
  State<DoneAnimationDialog> createState() => _DoneAnimationDialogState();
}

class _DoneAnimationDialogState extends State<DoneAnimationDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        HapticFeedback.lightImpact();
      }
      if (status == AnimationStatus.completed) {
        widget.onDone();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
          child: LottieBuilder.asset(
        Assets.doneAnimation,
        controller: _controller,
        onLoaded: (composition) {
          _controller.forward();
        },
      )),
    );
  }
}
