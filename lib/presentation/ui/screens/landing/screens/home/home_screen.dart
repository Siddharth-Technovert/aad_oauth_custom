import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/errors/app_exception.dart';
import '../../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../../core/utils/extensions/date_time_extension.dart';
import '../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../domain/states/news_by_category_state.dart';
import '../../../../../providers/news/news_by_category_provider.dart';
import '../../../../modals/snack_bar/snack_bar_factory.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/error_cards/no_internet_card.dart';
import '../../../../widgets/error_cards/something_went_wrong_card.dart';
import '../../../../widgets/shimmer/common_shimmer.dart';
import 'widgets/categories_view.dart';
import 'widgets/news_card.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsByCategoryState = ref.watch(newsByCategoryNotifierProvider);
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
            NewsByCategoryStateInitial() => const SliverFillRemaining(
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
            NewsByCategoryStateError(ex: var ex) => SliverToBoxAdapter(
                child: switch (ex) {
                  AppExceptionNetworkError() => NoConnectionCard(onPressed: () {
                      SnackbarFactory.noInternetCheck(ref, () async {
                        await ref
                            .read(newsByCategoryNotifierProvider.notifier)
                            .getNewsByCategory();
                      });
                    }),
                  _ => SomethingWentWrongCard(
                      onPressed: () {
                        SnackbarFactory.noInternetCheck(ref, () async {
                          await ref
                              .read(newsByCategoryNotifierProvider.notifier)
                              .getNewsByCategory();
                        });
                      },
                    )
                },
              ),
          },
        ),
        const SliverToBoxAdapter(child: UIDimensions.verticalSpaceSmall),
      ],
    );
  }
}
