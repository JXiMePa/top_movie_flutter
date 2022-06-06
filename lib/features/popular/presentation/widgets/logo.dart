import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Center(
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            child: Image.asset('assets/images/logo.jpeg')),
      ),
    );
  }
}
