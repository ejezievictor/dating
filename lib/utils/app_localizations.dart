import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for current locale
final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Helper method to get localized instance
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Helper method to get localized instance from WidgetRef
  static AppLocalizations fromRef(WidgetRef ref, BuildContext context) {
    final locale = ref.watch(localeProvider);
    return lookupAppLocalizations(locale);
  }

  // Lookup method to get instance for a specific locale
  static AppLocalizations lookupAppLocalizations(Locale locale) {
    return AppLocalizations(locale);
  }

  // Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('es'), // Spanish
    Locale('fr'), // French
  ];

  // Delegate for Flutter's localization system
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  // Translation maps
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Dating App',
      'strollBonfire': 'Stroll Bonfire',
      'pickYourOption': 'Pick your option.',
      'seeWhoHasSimilarMind': 'See who has a similar mind.',
      'noMoreQuestions': 'No more questions!',
      'messages': 'Messages',
      'yourConversations': 'Your conversations',
      'profile': 'Profile',
    },
    'es': {
      'appTitle': 'App de Citas',
      'strollBonfire': 'Hoguera de Paseo',
      'pickYourOption': 'Elige tu opción.',
      'seeWhoHasSimilarMind': 'Mira quién tiene una mente similar.',
      'noMoreQuestions': '¡No hay más preguntas!',
      'messages': 'Mensajes',
      'yourConversations': 'Tus conversaciones',
      'profile': 'Perfil',
    },
    'fr': {
      'appTitle': 'App de Rencontres',
      'strollBonfire': 'Feu de Promenade',
      'pickYourOption': 'Choisissez votre option.',
      'seeWhoHasSimilarMind': 'Voyez qui a un esprit similaire.',
      'noMoreQuestions': 'Plus de questions!',
      'messages': 'Messages',
      'yourConversations': 'Vos conversations',
      'profile': 'Profil',
    },
  };

  // Get a localized string
  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? 
           _localizedValues['en']?[key] ?? 
           'Translation not found';
  }

  // Shorthand method for translation
  String get appTitle => translate('appTitle');
  String get strollBonfire => translate('strollBonfire');
  String get pickYourOption => translate('pickYourOption');
  String get seeWhoHasSimilarMind => translate('seeWhoHasSimilarMind');
  String get noMoreQuestions => translate('noMoreQuestions');
  String get messages => translate('messages');
  String get yourConversations => translate('yourConversations');
  String get profile => translate('profile');

  // Format methods for dates, numbers, etc.
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat.yMd(locale.toString());
    return formatter.format(date);
  }

  String formatTime(DateTime time) {
    final DateFormat formatter = DateFormat.Hm(locale.toString());
    return formatter.format(time);
  }

  String formatTimeRemaining(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }
}

// Delegate implementation
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}