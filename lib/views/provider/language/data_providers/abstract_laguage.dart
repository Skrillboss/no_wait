import 'package:todo_turno/views/provider/language/data_providers/portuguese/portuguese_language.dart';
import 'package:todo_turno/views/provider/language/data_providers/russian/russian_language.dart';
import 'package:todo_turno/views/provider/language/data_providers/spanish/spanish_language.dart';
import 'arabic/arabic_language.dart';
import 'catalan/catalan_language.dart';
import 'chinese/chinese_language.dart';
import 'english/english_language.dart';
import 'french/french_language.dart';
import 'german/german_language.dart';
import 'japanese/japanese_language.dart';

abstract class Language {
  static Language english = EnglishLanguage();
  static Language spanish = SpanishLanguage();
  static Language german = GermanLanguage();
  static Language portuguese = PortugueseLanguage();
  static Language russian = RussianLanguage();
  static Language french = FrenchLanguage();
  static Language arabic = ArabicLanguage(); // Arabic
  static Language catalan = CatalanLanguage(); // Catalan
  static Language chinese = ChineseLanguage(); // Chinese
  static Language japanese = JapaneseLanguage(); // Japanese

  static List<Language> values = [
    spanish, english, portuguese, russian, french, german, arabic, catalan, chinese, japanese
  ];

  String value = 'spanish';
}