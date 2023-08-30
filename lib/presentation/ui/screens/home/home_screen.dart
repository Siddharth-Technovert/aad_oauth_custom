import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/extensions/date_time_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/states/news_by_category_state.dart';
import '../../../providers/news/news_by_category_provider.dart';
import '../../modals/snack_bar/snack_bar_factory.dart';
import '../../widgets/cards/something_went_wrong_card.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/shimmer/common_shimmer.dart';
import 'widget/categories_view.dart';
import 'widget/news_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsByCategoryState = ref.watch(newsByCategoryProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.titleLarge(context.appLoc.boilerplateNews),
              CustomText.bodySmall(
                  "${DateTime.now().week}, ${DateTime.now().yMMMMd}"),
            ],
          ),
          centerTitle: false,
        ),
        const SliverToBoxAdapter(child: CategoriesView()),
        const SliverToBoxAdapter(child: UIDimensions.verticalSpaceSmall),
        SliverPadding(
          padding: UIDimensions.symmetricPaddingGeometry(horizontal: 16),
          sliver: switch (newsByCategoryState) {
            NewsByCategoryStateInitial() => const SliverToBoxAdapter(
                child: SizedBox.shrink(),
              ),
            NewsByCategoryStateLoading() => SliverList.separated(
                itemBuilder: (context, index) => const CommonShimmer(
                  height: 86,
                  width: double.infinity,
                ),
                separatorBuilder: (context, index) =>
                    UIDimensions.verticalSpaceSmall,
                itemCount: 6,
              ),
            NewsByCategoryStateLoaded(news: var news) => SliverList.separated(
                itemBuilder: (context, index) => NewsCard(
                  article: news[index],
                ),
                separatorBuilder: (context, index) =>
                    UIDimensions.verticalSpaceSmall,
                itemCount: news.length,
              ),
            NewsByCategoryStateError() => SliverFillRemaining(
                child: SomethingWentWrongCard(
                  onPressed: () {
                    SnackbarFactory.noInternetCheck(ref, () async {
                      await ref
                          .read(newsByCategoryProvider.notifier)
                          .getNewsByCategory();
                    });
                  },
                ),
              ),
          },
        ),
        const SliverToBoxAdapter(child: UIDimensions.verticalSpaceSmall),
      ],
    );
  }
}
