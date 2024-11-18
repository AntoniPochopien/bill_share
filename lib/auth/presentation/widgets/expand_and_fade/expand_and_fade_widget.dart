import 'package:bill_share/auth/presentation/widgets/expand_and_fade/expand_and_fade_controller.dart';
import 'package:flutter/material.dart';

class ExpandAndFadeWidget extends StatefulWidget {
  final ExpandAndFadeController controller;
  final Widget child;
  final double height;
  final bool initialExpanded;
  const ExpandAndFadeWidget({
    super.key,
    required this.controller,
    required this.child,
    this.height = 67,
    this.initialExpanded = false,
  });

  @override
  State<ExpandAndFadeWidget> createState() => _ExpandAndFadeWidgetState();
}

class _ExpandAndFadeWidgetState extends State<ExpandAndFadeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  late Animation<double> _fadeAnimation;

  bool _showContainer = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _heightAnimation = Tween<double>(begin: 0, end: widget.height).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    widget.controller.attach(
      () => _startAnimation(),
      () => _reverseAnimation(),
    );

    if (widget.initialExpanded) {
      _animationController.value = 1.0;
      _showContainer = true;
    }

    _animationController.addListener(() {
      if (_animationController.value > 0.5 && !_showContainer) {
        setState(() {
          _showContainer = true;
        });
      } else if (_animationController.value <= 0.5 && _showContainer) {
        setState(() {
          _showContainer = false;
        });
      }
    });
  }

  void _startAnimation() {
    _animationController.forward();
  }

  void _reverseAnimation() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: widget.child,
      builder: (context, child) {
        return SizedBox(
          height: _heightAnimation.value,
          child: _showContainer
              ? Opacity(
                  opacity: _fadeAnimation.value,
                  child: child,
                )
              : null,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
