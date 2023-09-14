import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/l10n/app_loc.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../providers/core/language_provider.dart';
import '../../widgets/custom_text.dart';

@RoutePage()
class LanguageSelectionScreen extends ConsumerWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localLanguage = ref.watch(languageNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: CustomText.titleMedium(context.appLoc.languageSelection),
        leading: const AutoLeadingButton(),
        centerTitle: false,
      ),
      body: SafeArea(
        child: UIDimensions.padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemBuilder: (context, index) => LanguageSelectionTile(
              selectedLanguage: localLanguage,
              language: AppLoc.supportedLocale[index],
              languageString: AppLoc.supportedLocale[index].languageName,
            ),
            itemCount: AppLoc.supportedLocale.length,
            separatorBuilder: (context, index) =>
                UIDimensions.verticalSpaceMedium,
          ),
        ),
      ),
    );
  }
}

class LanguageSelectionTile extends ConsumerWidget {
  const LanguageSelectionTile({
    super.key,
    required this.selectedLanguage,
    required this.language,
    required this.languageString,
  });

  final Locale selectedLanguage;
  final Locale language;
  final String languageString;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (selectedLanguage != language) {
          ref.read(languageNotifierProvider.notifier).update(language);
        }
      },
      borderRadius: BorderRadius.circular(UIDimensions.radius(12)),
      child: Ink(
        padding: UIDimensions.symmetricPaddingGeometry(vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UIDimensions.radius(12)),
          color: selectedLanguage == language
              ? context.colorScheme.primaryContainer
              : context.colorScheme.surfaceVariant,
        ),
        child: Center(child: CustomText.titleLarge(languageString)),
      ),
    );
  }
}
