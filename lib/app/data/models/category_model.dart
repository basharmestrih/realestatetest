import 'package:get/get.dart';
import 'package:my_house_app/generated/locales.g.dart'; // adjust path if needed

class CategoryModel {
  static const List<String> _keys = [
    LocaleKeys.category_all,
    LocaleKeys.category_damascus,
    LocaleKeys.category_rif_dimashq,
    LocaleKeys.category_aleppo,
    LocaleKeys.category_homs,
    LocaleKeys.category_hama,
    LocaleKeys.category_lattakia,
    LocaleKeys.category_tartous,
    LocaleKeys.category_idleb,
    LocaleKeys.category_sweidaa,
    LocaleKeys.category_daraa,
    LocaleKeys.category_deir_ezzor,
    LocaleKeys.category_raqqa,
    LocaleKeys.category_hasaka,
    LocaleKeys.category_quneitra,
  ];

  static List<String> get categories => _keys.map((key) => key.tr).toList();
}
