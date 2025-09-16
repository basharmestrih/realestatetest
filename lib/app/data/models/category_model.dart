import 'package:get/get.dart';
import 'package:my_house_app/generated/locales.g.dart'; // adjust if needed

class CategoryModel {
  static const List<String> _keys = [
    LocaleKeys.category_all,
    LocaleKeys.category_damascus,
    LocaleKeys.category_aleppo,
    LocaleKeys.category_lattakia,
    LocaleKeys.category_homs,
    LocaleKeys.category_tartous,
    LocaleKeys.category_idleb,
    LocaleKeys.category_sweidaa,
  ];

  static List<String> get categories => _keys.map((key) => key.tr).toList();
}
