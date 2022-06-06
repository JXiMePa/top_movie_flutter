import 'package:auto_route/auto_route.dart';
import '../features/details/presentation/movie_details.dart';
import '../features/popular/presentation/pages/popular_movies.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: PopularMoviesScreen, initial: true),
    AutoRoute(page: MovieDetailsScreen, path: MovieDetailsScreen.routName),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
