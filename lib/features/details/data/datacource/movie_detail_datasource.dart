import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:popular_movies/features/details/data/models/movie_detail.dart';
import '../../../../common/constants.dart';
import '../../../../common/network_result.dart';
import 'package:http/http.dart' as http;
import '../../../../translations/locale_keys.g.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<Result<MovieDetails, NetworkError>> getMovieDetailsBy(int movieId);
}

class MovieDetailsRemoteDataSourceImp implements MovieDetailsRemoteDataSource {
  final String _basePath = '/3/movie';
  final client = http.Client();

  @override
  Future<Result<MovieDetails, NetworkError>> getMovieDetailsBy(
      int movieId) async {
    final queryParameters = {
      'api_key': 'f910e2224b142497cc05444043cc8aa4',
      'language': "ru"
    };
    try {
      final uri =
          Uri.https(AppURL.baseApiUrl, "$_basePath/$movieId", queryParameters);
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return Result(success: MovieDetails.fromJson(json));
    } catch (_) {
      return Result(error: NetworkError(message: LocaleKeys.errorMessage.tr()));
    }
  }
}
