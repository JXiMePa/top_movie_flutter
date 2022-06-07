import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../common/constants.dart';
import '../../../../common/widgets/title_subtitle_in_line.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../data/models/movie_detail.dart';

class DetailsDescriptions extends StatelessWidget {
  const DetailsDescriptions({
    Key? key,
    required this.movieDetailsModel,
  }) : super(key: key);

  final MovieDetails movieDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            if (movieDetailsModel.budget != 0)
              TitleSubtitleInLine(
                  title: "${LocaleKeys.budget.tr()}: ",
                  subTitle: "${movieDetailsModel.budget} \$"),
            if (movieDetailsModel.revenue != 0)
              TitleSubtitleInLine(
                  title: "${LocaleKeys.revenue.tr()}: ",
                  subTitle: "${movieDetailsModel.revenue} \$"),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 19.0, horizontal: 6.0),
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
    );
  }
}
