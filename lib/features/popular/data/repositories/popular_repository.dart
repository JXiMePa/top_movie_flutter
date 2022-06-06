import 'package:popular_movies/features/popular/data/models/popular_responce.dart';
import '../../../../common/network_result.dart';
import '../../domain/repositories/popular_repository.dart';
import '../datasource/popular_remote_datasource.dart';

class PopularRepositoryImp implements PopularRepository {
  final PopularRemoteDataSource remoteDatasource;
  PopularRepositoryImp({required this.remoteDatasource});

  @override
  Future<Result<MovieResponce, NetworkError>> getPopularMovie(
      int pageIndex) async {
    final responce = await remoteDatasource.getPopularMovie(pageIndex);
    return responce;
  }
}
