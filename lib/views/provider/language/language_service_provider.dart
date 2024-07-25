import 'package:flutter/cupertino.dart';

import 'data_providers/abstract_laguage.dart';

class LanguageServiceProvider with ChangeNotifier{
  Language _languageSelected = Language.spanish;

  Language get languageSelected => _languageSelected;

  changeLanguage(String language) {
    _languageSelected = Language.values.firstWhere((e) => e.value == language);
    notifyListeners();
    return _languageSelected;
  }
}

