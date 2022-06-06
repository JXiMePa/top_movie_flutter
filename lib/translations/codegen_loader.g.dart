// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ua_UA = {
  "title": "Кращі фільми",
  "cancel": "скасувати",
  "errorMessage": "Упс! Щось пішло не так",
  "ok": "OK",
  "vote": "Оцінка",
  "vote_count": "Кількість голосів",
  "budget": "Бюджет",
  "revenue": "Касові збори",
  "play": "Дивитись",
  "buy_subscription": "Необхідно купити передплату :)"
};
static const Map<String,dynamic> ru_RU = {
  "title": "Лучшие фильмы",
  "cancel": "Отмена",
  "errorMessage": "Упс! Что-то пошло не так",
  "ok": "OK",
  "vote": "Оценка",
  "vote_count": "Количество голосов",
  "budget": "Бюджет",
  "revenue": "Доход",
  "play": "Смотреть",
  "buy_subscription": "Необходимо купить подписку :)"
};
static const Map<String,dynamic> en_US = {
  "title": "Top movies",
  "cancel": "Cancel",
  "errorMessage": "Oops, something went wrong",
  "ok": "OK",
  "vote": "Vote",
  "vote_count": "Vote сount",
  "budget": "Budget",
  "revenue": "Revenue",
  "play": "Play",
  "buy_subscription": "You need to buy a subscription :)"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ua_UA": ua_UA, "ru_RU": ru_RU, "en_US": en_US};
}
