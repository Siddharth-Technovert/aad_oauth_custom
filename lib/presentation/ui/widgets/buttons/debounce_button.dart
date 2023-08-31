import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class DebouncedButton extends StatefulWidget {
  final Widget _child;
  final VoidCallback _onPressed;
  final Duration _duration;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? bgColor;
  final double cornerRadius;
  final double cornerSmoothing;

  DebouncedButton({
    super.key,
    required Widget child,
    required VoidCallback onPressed,
    this.cornerRadius = 16,
    this.cornerSmoothing = 1,
    this.splashColor,
    this.bgColor,
    this.highlightColor,
    int debounceTimeMs = 200,
  })  : _child = child,
        _onPressed = onPressed,
        _duration = Duration(milliseconds: debounceTimeMs);

  @override
  DebouncedButtonState createState() => DebouncedButtonState();
}

class DebouncedButtonState extends State<DebouncedButton> {
  late ValueNotifier<bool> _isEnabled;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _isEnabled = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isEnabled,
      builder: (context, bool isEnabled, child) => Material(
        color: widget.bgColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(
          UIDimensions.radius(widget.cornerRadius),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              UIDimensions.radius(widget.cornerRadius),
            ),
          ),
          splashColor: widget.splashColor,
          highlightColor: widget.highlightColor,
          onTap: isEnabled ? _onButtonPressed : null,
          child: widget._child,
        ),
      ),
    );
  }

  void _onButtonPressed() {
    _isEnabled.value = false;
    widget._onPressed();
    _timer = Timer(widget._duration, () => _isEnabled.value = true);
  }
}
