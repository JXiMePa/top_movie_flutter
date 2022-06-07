import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:popular_movies/translations/locale_keys.g.dart';
import '../../../../common/constants.dart';
import '../../../../common/network_result.dart';
import '../models/popular_responce.dart';
import 'package:http/http.dart' as http;

abstract class PopularRemoteDataSource {
  Future<Result<MovieResponce, NetworkError>> getPopularMovie(int page);
}

class PopularRemoteDataSourceImp implements PopularRemoteDataSource {
  final String _basePath = '/3/movie/popular';
  final client = http.Client();

  @override
  Future<Result<MovieResponce, NetworkError>> getPopularMovie(
      int pageIndex) async {
    final queryParameters = {
      'api_key': AppConstants.apiKey,
      'page': "$pageIndex",
      'language': "ru"
    };
    try {
      final uri =
          Uri.https(AppConstants.baseApiUrl, _basePath, queryParameters);
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return Result(success: MovieResponce.fromJson(json));
    } catch (error) {
      return Result(error: NetworkError(message: LocaleKeys.errorMessage.tr()));
    }
  }
}
