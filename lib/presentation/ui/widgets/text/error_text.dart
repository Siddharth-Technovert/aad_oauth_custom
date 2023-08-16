import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../hooks/app_loc_hook.dart';
import 'text_regular.dart';

class ErrorText extends HookWidget {
  final String errorTxt;
  const ErrorText({
    Key? key,
    required this.errorTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = useAppLoc();
    // TODO: implement build
    return Center(
      child: TextRegular(appLoc.errorText(errorTxt)),
    );
  }
}
