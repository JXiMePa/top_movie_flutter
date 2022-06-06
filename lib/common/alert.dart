import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../translations/locale_keys.g.dart';

mixin ShowAlertDialog {
  void showAlert(
      {required BuildContext context,
      String? title,
      String? message,
      List<CupertinoDialogAction>? actions}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: (title != null) ? Text(title) : null,
        content: (message != null) ? Text(message) : null,
        actions: <CupertinoDialogAction>[
          ...?actions,
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(LocaleKeys.ok.tr()),
          )
        ],
      ),
    );
  }
}
