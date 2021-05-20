import 'package:flutter/widgets.dart';
import 'package:gipher/i18n/i18n.dart';

class R {
  static Translations translations = PtBr();

  static void load(Locale locale) {
    switch (locale.toString()) {
      case 'en_US':
        translations = EnUS();
        break;
      default:
        translations = PtBr();
        break;
    }
  }
}
