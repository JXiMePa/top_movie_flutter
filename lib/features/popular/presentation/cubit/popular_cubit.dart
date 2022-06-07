import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/popular_responce.dart';
import '../../domain/repositories/popular_repository.dart';

part 'popular_state.dart';
part 'popular_cubit.freezed.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit({required this.repository}) : super(PopularStateImp.initial());

  final PopularRepository repository;
  List<Movie> movies = [];
  int pageIndex = 1;

  void uploadNext() async {
    emit(PopularStateImp.upload(isUploaded: false, models: movies));

    final result = await repository.getPopularMovie(pageIndex);
    if (result.error != null) {
      final message = result.error?.message ?? "";
      emit(PopularStateImp.error(
          message: message, models: movies, isUploaded: false));
      return;
    }

    if (result.success != null) {
      final models = result.success?.results ?? [];

      movies += models;
      pageIndex++;
      emit(PopularStateImp.upload(isUploaded: true, models: movies));
      return;
    }
  }
}
