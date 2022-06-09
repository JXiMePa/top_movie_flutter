import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/alert.dart';
import '../../../../translations/locale_keys.g.dart';
import '../cubit/popular_cubit.dart';
import '../widgets/logo.dart';
import '../widgets/movie_list.dart';

class PopularMoviesScreen extends StatelessWidget with ShowAlertDialog {
  PopularMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            LocaleKeys.title.tr(),
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        child: BlocConsumer<PopularCubit, PopularState>(
          // buildWhen: (previous, current) {
          //   return true;
          // },
          builder: (context, state) {
            if (state is PopularStateImp) {
              if (state is InitialPopularState) {
                return const Logo();
              }
              if (state is UploadPopularState || state is ErrorPopularState) {
                return MovieList(
                    movies: state.models, isUploaded: state.isUploaded);
              }
            }
            return Container(color: Colors.black);
          },
          listener: (context, state) {
            if (state is ErrorPopularState) {
              showAlert(context: context, title: state.message, message: "");
              return;
            }
          },
        ));
  }
}
