import 'dart:convert';

class MovieDetails {
  MovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.id,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final int budget;
  final int id;
  final String overview;
  final double popularity;
  final String? releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final String title;
  final double voteAverage;
  final int voteCount;

  String get imageUrl {
    if (backdropPath == null) {
      return "";
    }
    return "https://image.tmdb.org/t/p/original$backdropPath";
  }

  MovieDetails copyWith({
    required bool adult,
    required String backdropPath,
    required int budget,
    required int id,
    required String overview,
    required double popularity,
    required String releaseDate,
    required int revenue,
    required int runtime,
    required String status,
    required String tagline,
    required String title,
    required double voteAverage,
    required int voteCount,
  }) =>
      MovieDetails(
        adult: adult,
        backdropPath: backdropPath,
        budget: budget,
        id: id,
        overview: overview,
        popularity: popularity,
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        status: status,
        tagline: tagline,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  factory MovieDetails.fromRawJson(String str) =>
      MovieDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        budget: json["budget"],
        id: json["id"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        releaseDate: json["release_date"],
        revenue: json["revenue"],
        runtime: json["runtime"],
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "budget": budget,
        "id": id,
        "overview": overview,
        "popularity": popularity,
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "status": status,
        "tagline": tagline,
        "title": title,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
