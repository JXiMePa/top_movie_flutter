import 'dart:convert';

class MovieResponce {
  MovieResponce({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieResponce copyWith(
    int page,
    List<Movie> results,
    int totalPages,
    int totalResults,
  ) =>
      MovieResponce(
        page: page,
        results: results,
        totalPages: totalPages,
        totalResults: totalResults,
      );

  factory MovieResponce.fromRawJson(String str) =>
      MovieResponce.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieResponce.fromJson(Map<String, dynamic> json) => MovieResponce(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final int id;
  final String overview;
  final double popularity;
  final String posterPath;
  final String? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  String get imageUrl {
    if (backdropPath == null) {
      return "";
    }
    return "https://image.tmdb.org/t/p/original$backdropPath";
  }

  Movie copyWith(
    bool adult,
    String backdropPath,
    int id,
    String overview,
    double popularity,
    String posterPath,
    String releaseDate,
    String title,
    bool video,
    double voteAverage,
    int voteCount,
  ) =>
      Movie(
        adult: adult,
        backdropPath: backdropPath,
        id: id,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        if (releaseDate != null) "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
