part of 'popular_cubit.dart';

abstract class PopularState {
  List<Movie> models;
  bool isUploaded;

  PopularState(this.models, this.isUploaded);
}

@freezed
class PopularStateImp extends PopularState with _$PopularStateImp {
  PopularStateImp._() : super([], false);
  factory PopularStateImp.initial() = InitialPopularState;
  factory PopularStateImp.upload(
      {required bool isUploaded,
      required List<Movie> models}) = UploadPopularState;
  factory PopularStateImp.error(
      {required String message,
      required bool isUploaded,
      required List<Movie> models}) = ErrorPopularState;
}
