import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/movie_detail.dart';
import '../../domain/repositories/movie_details_repository.dart';

part 'movie_details_state.dart';
part 'movie_details_cubit.freezed.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit({required this.repository, required this.movieId})
      : super(const MovieDetailsState.initial());
  final MovieDetailsRepository repository;
  final int movieId;

  void upload() async {
    final result = await repository.getMovieDetails(movieId);
    if (result.error != null) {
      final message = result.error?.message ?? "";
      emit(MovieDetailsState.error(message: message));
      return;
    }
    if (result.success != null) {
      emit(MovieDetailsState.upload(model: result.success!));
      return;
    }
  }
}
