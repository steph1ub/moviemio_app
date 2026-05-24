

class Movie{
  final int id;
 final String title;
 final String overview;
 final String posterPath; 
 final String backdropPath;
 final double voteAverage;
 final String releaseDate;

  Movie({required this.id, required this.title, required this.overview, required this.posterPath, required this.backdropPath, required this.voteAverage, required this.releaseDate});

factory Movie.fromMap(Map<String, dynamic> map){
  return Movie(
    id: map['id'],
    title: map['title'],
    overview: map['overview'],
    posterPath: map['poster_path'],
    backdropPath: map['backdrop_path'],
    voteAverage: map['vote_average'],
    releaseDate: map['release_date'],
  );
  }



Map<String, dynamic> toMap(){
  return {
    'title': title,
    'overview': overview,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
    'id': id,
    'release_date': releaseDate,
  };
}

}


