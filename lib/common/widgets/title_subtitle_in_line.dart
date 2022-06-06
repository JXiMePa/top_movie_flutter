import 'package:flutter/material.dart';
import 'package:popular_movies/common/constants.dart';

class TitleSubtitleInLine extends StatelessWidget {
  const TitleSubtitleInLine(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: AppColors.amber,
                  fontSize: AppFontSize.mediumText,
                  fontWeight: FontWeight.bold)),
          Text(subTitle,
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: AppFontSize.semiLargeText,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
