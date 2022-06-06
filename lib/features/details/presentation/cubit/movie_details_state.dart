part of 'movie_details_cubit.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _InitialMovieDetailsState;
  const factory MovieDetailsState.upload({required MovieDetails model}) =
      UploadMovieDetailsState;
  const factory MovieDetailsState.error({required String message}) =
      ErrorMovieDetailsState;
}
