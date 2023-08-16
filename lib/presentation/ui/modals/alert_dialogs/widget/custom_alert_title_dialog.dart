import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/colors/colors.dart';
import '../../../../../core/utils/styles/dimensions/dimens.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../widgets/buttons/debounce_button.dart';
import '../../../widgets/text/text_regular.dart';

class CustomAlertTitleDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback allowCallback;

  const CustomAlertTitleDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.allowCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 16.r,
                        cornerSmoothing: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 32.h,
                      horizontal: 21.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: context.h4.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        UIDimensions.verticalSpace(24),
                        TextRegular(
                          description,
                          fontSize: fontMedium2,
                          maxLines: 50,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6, top: 4).w,
                  child: Material(
                    color: Colors.transparent,
                    child: DebouncedButton(
                      onPressed: () => Navigator.pop(context),
                      cornerRadius: 24,
                      child: Padding(
                        padding: const EdgeInsets.all(10).w,
                        child: Icon(
                          Icons.close,
                          color: UIColors.light.slate400,
                        ),
                      ),
                    ),
                  ),
                ),
                // Material(
                //   color: Colors.transparent,
                //   child: IconButton(
                //     onPressed: () => context.popRoute(),
                //     style: IconButton.styleFrom(
                //       backgroundColor: Colors.transparent,
                //     ),
                //     icon: Icon(
                //       Icons.close,
                //       color: UIColors.light.slate400,
                //       size: 20,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
