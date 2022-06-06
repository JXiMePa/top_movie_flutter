import '../../../../common/network_result.dart';
import '../../data/models/movie_detail.dart';

abstract class MovieDetailsRepository {
  Future<Result<MovieDetails, NetworkError>> getMovieDetails(int movieId);
}
