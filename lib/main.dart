import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/routes/app_router.dart';
import 'common/constants.dart';
import 'features/popular/data/datasource/popular_remote_datasource.dart';
import 'features/popular/data/repositories/popular_repository.dart';
import 'features/popular/presentation/cubit/popular_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
          Locale('uk', 'UA')
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: AppWidget()),
  );
}

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((providerContext) => PopularCubit(
            repository: PopularRepositoryImp(
                remoteDatasource: PopularRemoteDataSourceImp()))
          ..uploadNext()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    color: AppColors.amberGrey,
                    fontSize: AppFontSize.largeTitleText,
                    fontWeight: FontWeight.bold),
                backgroundColor: AppColors.amber),
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
            backgroundColor: AppColors.amberGrey,
          ),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ));
  }
}
