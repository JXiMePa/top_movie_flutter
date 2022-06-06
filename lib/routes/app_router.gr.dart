// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PopularMoviesRoute.name: (routeData) {
      final args = routeData.argsAs<PopularMoviesRouteArgs>(
          orElse: () => const PopularMoviesRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: PopularMoviesScreen(key: args.key));
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: MovieDetailsScreen(key: args.key, movieId: args.movieId));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(PopularMoviesRoute.name, path: '/'),
        RouteConfig(MovieDetailsRoute.name, path: 'movie-details/')
      ];
}

/// generated route for
/// [PopularMoviesScreen]
class PopularMoviesRoute extends PageRouteInfo<PopularMoviesRouteArgs> {
  PopularMoviesRoute({Key? key})
      : super(PopularMoviesRoute.name,
            path: '/', args: PopularMoviesRouteArgs(key: key));

  static const String name = 'PopularMoviesRoute';
}

class PopularMoviesRouteArgs {
  const PopularMoviesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'PopularMoviesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MovieDetailsScreen]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({Key? key, required int movieId})
      : super(MovieDetailsRoute.name,
            path: 'movie-details/',
            args: MovieDetailsRouteArgs(key: key, movieId: movieId));

  static const String name = 'MovieDetailsRoute';
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.movieId});

  final Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }
}
