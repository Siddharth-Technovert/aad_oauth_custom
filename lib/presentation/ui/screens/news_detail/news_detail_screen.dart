import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/models/article/article.dart';
import '../../widgets/custom_network_image.dart';
import '../../widgets/custom_text.dart';

@RoutePage()
class NewsDetailScreen extends ConsumerWidget {
  const NewsDetailScreen({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.titleMedium(context.appLoc.news),
        leading: const AutoLeadingButton(),
        centerTitle: false,
      ),
      body: SafeArea(
        child: UIDimensions.padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ListView(
            children: [
              CustomText.titleMedium(
                article.title ?? "",
                textOverflow: null,
              ),
              UIDimensions.verticalSpaceMedium,
              CustomNetworkImage(
                imageUrl: article.urlToImage ?? "",
              ),
              UIDimensions.verticalSpaceMedium,
              CustomText.bodyMedium(
                article.description ?? "",
                textOverflow: null,
              ),
              UIDimensions.verticalSpaceSmall,
              CustomText.titleSmall(
                article.author ?? "",
                textOverflow: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
