class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final List<String> genres;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.genres,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      voteAverage: (json['vote_average'] as num).toDouble(),
      genres: (json['genres'] as List).map((g) => g['name'] as String).toList(),
    );
  }
}
