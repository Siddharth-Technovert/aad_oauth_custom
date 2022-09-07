import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/utils/styles/ui_helper.dart';
import '../../../../domain/enums/toast_type.dart';
import '../../hooks/is_dark_mode_hook.dart';

class MessageToast extends HookWidget {
  const MessageToast({
    Key? key,
    this.title,
    required this.message,
    required this.toastType,
    required this.onDismiss,
    required this.seconds,
  }) : super(key: key);

  final String? title;
  final String message;
  final ToastType toastType;
  final int seconds;
  final void Function() onDismiss;

  @override
  Widget build(BuildContext context) {
    final bool isDark = useIsDarkHook();
    return Dismissible(
      key: Key(message),
      onDismissed: (direction) {
        onDismiss();
      },
      direction: DismissDirection.up,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: seconds.toDouble()),
        duration: Duration(seconds: seconds),
        builder: (context, double value, child) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? const Color.fromRGBO(0, 0, 0, 0.4)
                          : const Color(0xffe5e5e5),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    // SvgPicture.asset(
                    //   isDark ? toastType.darkIconPath : toastType.lightIconPath,
                    //   width: 40,
                    //   height: 40,
                    // ),
                    UIHelper.horizontalSpaceMedium,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title ?? toastType.val,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          Text(
                            message,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Column(
                    children: [
                      const Spacer(),
                      Transform.rotate(
                        angle: math.pi,
                        child: LinearProgressIndicator(
                          minHeight: 5,
                          value: 1 - (value / seconds),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            toastType.color,
                          ),
                          backgroundColor: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
