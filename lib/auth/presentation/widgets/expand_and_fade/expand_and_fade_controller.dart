import 'package:flutter/foundation.dart';

class ExpandAndFadeController {
  VoidCallback? _onExpand;
  VoidCallback? _onCollapse;

  void attach(VoidCallback onExpand, VoidCallback onCollapse) {
    _onExpand = onExpand;
    _onCollapse = onCollapse;
  }

  void expand() {
    _onExpand?.call();
  }

  void collapse() {
    _onCollapse?.call();
  }
}