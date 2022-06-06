import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/routes/app_router.dart';
import '../../../../common/widgets/image_title_subtitle.dart';
import '../../data/models/popular_responce.dart';
import 'package:auto_route/auto_route.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  final Movie movie;
  static const double cornerRadius = 20;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(MovieDetailsRoute(movieId: movie.id));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(MovieCard.cornerRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MovieCard.cornerRadius),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                    errorWidget: (context, string, _) => Image.asset(
                        "assets/images/placeholder.png",
                        fit: BoxFit.cover),
                    height: 210,
                    width: double.infinity,
                    imageUrl: movie.imageUrl,
                    fit: BoxFit.cover),
                ImagesTitleSubtitle(
                    title: movie.title, subtitle: movie.overview),
              ],
            ),
          ),
        ));
  }
}
