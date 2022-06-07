import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/features/details/presentation/widgets/play_button.dart';
import '../../../common/alert.dart';
import '../../../translations/locale_keys.g.dart';
import '../data/datacource/movie_detail_datasource.dart';
import '../data/repositories/movie_details_repository.dart';
import 'cubit/movie_details_cubit.dart';
import 'widgets/details_description.dart';
import 'widgets/details_header.dart';

class MovieDetailsScreen extends StatelessWidget with ShowAlertDialog {
  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);
  static const routName = "movie-details/";
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(
          movieId: movieId,
          repository: MovieDetailsRepositoryImp(
              remoteDatasource: MovieDetailsRemoteDataSourceImp()))
        ..upload(),
      child: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        listener: (context, state) {
          if (state is ErrorMovieDetailsState) {
            showAlert(context: context, title: state.message);
            return;
          }
        },
        builder: (context, state) {
          final size = MediaQuery.of(context).size;

          if (state is UploadMovieDetailsState) {
            final movieDetailsModel = state.model;
            return Scaffold(
              body: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DetailsHeader(
                      movieDetailsModel: movieDetailsModel,
                      height: size.height * 0.6),
                  PlayButton(
                      key: key,
                      playAction: () {
                        showAlert(
                            context: context,
                            title: LocaleKeys.buy_subscription.tr());
                      }),
                  DetailsDescriptions(movieDetailsModel: movieDetailsModel)
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
