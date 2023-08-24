import 'package:flutter/widgets.dart';

import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          UIDimensions.radius(8),
        ),
      ),
    );
  }
}
