import 'package:popular_movies/features/details/data/datacource/movie_detail_datasource.dart';
import 'package:popular_movies/features/details/data/models/movie_detail.dart';
import 'package:popular_movies/features/details/domain/repositories/movie_details_repository.dart';
import '../../../../common/network_result.dart';

class MovieDetailsRepositoryImp implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource remoteDatasource;
  MovieDetailsRepositoryImp({required this.remoteDatasource});

  @override
  Future<Result<MovieDetails, NetworkError>> getMovieDetails(
      int movieId) async {
    final result = await remoteDatasource.getMovieDetailsBy(movieId);
    return result;
  }
}
