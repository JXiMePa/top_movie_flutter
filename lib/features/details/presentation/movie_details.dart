import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/common/constants.dart';
import '../../../common/alert.dart';
import '../../../translations/locale_keys.g.dart';
import '../data/datacource/movie_detail_datasource.dart';
import '../data/repositories/movie_details_repository.dart';
import 'cubit/movie_details_cubit.dart';
import '../../../common/widgets/title_subtitle_in_line.dart';
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: const Color.fromARGB(180, 0, 0, 0),
                          elevation: 8,
                          primary: AppColors.amber,
                          textStyle: const TextStyle(
                              fontSize: AppFontSize.largeTitleText,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        showAlert(
                            context: context,
                            title: LocaleKeys.buy_subscription.tr());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.play_circle_outline,
                              size: 40.0, color: AppColors.white),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(LocaleKeys.play.tr()),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.only(top: 6.0),
                      width: double.infinity,
                      alignment: AlignmentDirectional.centerStart,
                      child: Column(
                        children: [
                          TitleSubtitleInLine(
                              title: "${LocaleKeys.vote.tr()}: ",
                              subTitle: "${movieDetailsModel.voteAverage}"),
                          TitleSubtitleInLine(
                              title: "${LocaleKeys.vote_count.tr()}: ",
                              subTitle: "${movieDetailsModel.voteCount}"),
                          TitleSubtitleInLine(
                              title: "${LocaleKeys.budget.tr()}: ",
                              subTitle: "${movieDetailsModel.budget} \$"),
                          TitleSubtitleInLine(
                              title: "${LocaleKeys.revenue.tr()}: ",
                              subTitle: "${movieDetailsModel.revenue} \$"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 19.0, horizontal: 6.0),
                            child: Text(movieDetailsModel.overview,
                                style: const TextStyle(
                                    wordSpacing: 1.2,
                                    fontStyle: FontStyle.italic,
                                    color: AppColors.white,
                                    fontSize: AppFontSize.mediumText,
                                    fontWeight: FontWeight.normal)),
                          )
                        ],
                      ),
                    ),
                  )
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
