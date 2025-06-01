import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/app_localizations.dart';
import '../utils/theme_utils.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<Locale>(
        value: currentLocale,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        elevation: 16,
        style: AppTheme.bodyStyle,
        underline: Container(height: 0),
        dropdownColor: AppTheme.cardColor,
        onChanged: (Locale? newValue) {
          if (newValue != null) {
            ref.read(localeProvider.notifier).state = newValue;
          }
        },
        items: AppLocalizations.supportedLocales
            .map<DropdownMenuItem<Locale>>((Locale locale) {
          return DropdownMenuItem<Locale>(
            value: locale,
            child: Text(_getLanguageName(locale.languageCode)),
          );
        }).toList(),
      ),
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      default:
        return languageCode;
    }
  }
}