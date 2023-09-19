import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/router/app_router.dart';
import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../../domain/models/article/article.dart';
import '../../../../../../providers/core/router_provider.dart';
import '../../../../../widgets/custom_network_image.dart';
import '../../../../../widgets/custom_text.dart';

class NewsCard extends ConsumerWidget {
  final Article article;
  const NewsCard({required this.article, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      // elevation: 0,
      // color: context.colorScheme.surfaceVariant,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIDimensions.radius(12))),
      child: InkWell(
        onTap: () {
          ref.read(appRouterProvider).push(NewsDetailRoute(article: article));
        },
        borderRadius: BorderRadius.circular(UIDimensions.radius(12)),
        child: UIDimensions.padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: UIDimensions.padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.titleMedium(
                        article.title ?? "",
                        maxLines: 2,
                      ),
                      UIDimensions.verticalSpaceSmall,
                      CustomText.titleSmall(
                        article.author ?? "",
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(UIDimensions.radius(16)),
                  child: CustomNetworkImage(
                    imageUrl: article.urlToImage ?? "",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
