import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../common/constants.dart';
import '../../data/models/movie_detail.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required this.movieDetailsModel,
    required this.height,
  }) : super(key: key);

  final MovieDetails movieDetailsModel;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      child: Stack(alignment: AlignmentDirectional.bottomStart, children: [
        CachedNetworkImage(
          imageUrl: movieDetailsModel.imageUrl,
          height: height,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          width: double.infinity,
          color: AppColors.black45,
          child: Column(
            children: [
              Text(
                movieDetailsModel.title,
                style: const TextStyle(
                    color: AppColors.white,
                    fontSize: AppFontSize.largeTitleText,
                    fontWeight: FontWeight.bold),
              ),
              if (movieDetailsModel.tagline.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(movieDetailsModel.tagline,
                      style: const TextStyle(
                          color: AppColors.amber,
                          fontSize: AppFontSize.mediumText,
                          fontWeight: FontWeight.w400)),
                )
            ],
          ),
        )
      ]),
    );
  }
}
