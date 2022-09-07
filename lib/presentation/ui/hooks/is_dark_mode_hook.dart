import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

bool useIsDarkHook() {
  final context = useContext();
  return Theme.of(context).colorScheme.brightness == Brightness.dark;
}
