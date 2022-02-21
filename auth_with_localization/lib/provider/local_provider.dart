import 'package:flutter/material.dart';
import 'package:auth_with_localization/l10n/l10n.dart';

class LocalProvideer extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void setlocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
