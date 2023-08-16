import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/colors/colors.dart';
import '../../../../../core/utils/styles/decorations/corner_shape_decoration.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../widgets/buttons/debounce_button.dart';
import '../../../widgets/text/text_bold.dart';
import '../../../widgets/text/text_regular.dart';

class CustomAlertDialog extends StatelessWidget {
  final VoidCallback allowCallBack;
  final String title;
  final String? subtitle;
  final String positiveButtonText;
  final String negativeButtonText;
  const CustomAlertDialog({
    Key? key,
    required this.allowCallBack,
    required this.title,
    this.subtitle,
    required this.positiveButtonText,
    required this.negativeButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).h,
            child: Container(
              decoration: roundCornerSolidBg(
                isBorderVisible: false,
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ).w,
                    child: Column(
                      children: [
                        UIDimensions.verticalSpaceMedium,
                        TextBold(
                          title,
                          textOverflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                        ),
                        UIDimensions.verticalSpaceMedium,
                        if (subtitle != null)
                          TextRegular(
                            subtitle!,
                            textOverflow: null,
                            textAlign: TextAlign.center,
                          ),
                        UIDimensions.verticalSpaceMedium,
                        Row(
                          children: [
                            Expanded(
                              child: DebouncedButton(
                                cornerSmoothing: 1.r,
                                cornerRadius: 4,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.h, bottom: 8.h),
                                  child: Center(
                                    child: TextRegular(
                                      negativeButtonText,
                                      fontSize: 16.sp,
                                      textOverflow: TextOverflow.clip,
                                      color: UIColors.light.slate700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: DebouncedButton(
                                cornerSmoothing: 1.r,
                                cornerRadius: 4,
                                onPressed: allowCallBack,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.h, bottom: 8.h),
                                  child: Center(
                                    child: TextBold(
                                      positiveButtonText,
                                      textOverflow: TextOverflow.clip,
                                      color: context.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
