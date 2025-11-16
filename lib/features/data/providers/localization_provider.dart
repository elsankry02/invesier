import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constant/app_enums.dart';
import 'provider.dart';

abstract class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class LocalizationSuccess extends LocalizationState {
  final String isSelectedLang;

  LocalizationSuccess({required this.isSelectedLang});
}

class LocalizationNotifier extends Notifier<LocalizationState> {
  @override
  LocalizationState build() {
    return LocalizationInitial();
  }

  localiztation(Localization localization) {
    switch (localization) {
      case Localization.initial:
        if (ref.read(prefsProvider).getString("lang") != null) {
          if (ref.read(prefsProvider).getString("lang") == "en") {
            state = LocalizationSuccess(isSelectedLang: "en");
          } else {
            state = LocalizationSuccess(isSelectedLang: "ar");
          }
        }
      case Localization.english:
        ref.read(prefsProvider).setString("lang", "en");
        state = LocalizationSuccess(isSelectedLang: "en");
      case Localization.arabic:
        ref.read(prefsProvider).setString("lang", "ar");
        state = LocalizationSuccess(isSelectedLang: "ar");
    }
  }
}

final localizationProvider =
    NotifierProvider<LocalizationNotifier, LocalizationState>(() {
      return LocalizationNotifier();
    });
