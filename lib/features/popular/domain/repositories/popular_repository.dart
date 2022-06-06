import '../../../../common/network_result.dart';
import '../../data/models/popular_responce.dart';

abstract class PopularRepository {
  Future<Result<MovieResponce, NetworkError>> getPopularMovie(int pageIndex);
}
