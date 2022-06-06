# README

# <<  generate easy_localization >>
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys

# <<  generate freezed >>     (xxxx_xxx.dart - имя модели не подходит)
flutter pub run build_runner watch --delete-conflicting-outputs
