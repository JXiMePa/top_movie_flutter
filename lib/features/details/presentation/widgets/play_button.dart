import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../common/constants.dart';
import '../../../../translations/locale_keys.g.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key, required this.playAction}) : super(key: key);

  final Function playAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: AppColors.scaffoldBackground,
            elevation: 10,
            shadowColor: AppColors.amber,
            primary: AppColors.amber,
            textStyle: const TextStyle(
                fontSize: AppFontSize.largeTitleText,
                fontWeight: FontWeight.bold)),
        onPressed: () {
          playAction();
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
    );
  }
}
