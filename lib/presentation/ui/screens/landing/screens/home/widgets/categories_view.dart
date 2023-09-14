import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../providers/news/news_by_category_provider.dart';
import '../../../../../modals/snack_bar/snack_bar_factory.dart';
import '../../../../../widgets/custom_text.dart';

class CategoriesView extends ConsumerWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categorySelectionChipsNotifierProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: List.generate(
            categories.length,
            (index) => UIDimensions.padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 0,
                  right: index != categories.length - 1 ? 8 : 16),
              child: FilterChip(
                disabledColor: context.primary,
                label: CustomText.titleSmall(
                  categories[index],
                ),
                selected: selectedCategory.contains(categories[index]),
                onSelected: (val) {
                  SnackbarFactory.noInternetCheck(ref, () async {
                    if (ref
                        .read(categorySelectionChipsNotifierProvider)
                        .contains(categories[index])) {
                      ref
                          .read(categorySelectionChipsNotifierProvider.notifier)
                          .updateTo(categories[0]);
                    } else {
                      ref
                          .read(categorySelectionChipsNotifierProvider.notifier)
                          .updateTo(categories[index]);
                    }
                    ref
                        .read(newsByCategoryNotifierProvider.notifier)
                        .getNewsByCategory(
                          category:
                              ref.read(categorySelectionChipsNotifierProvider),
                        );
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
