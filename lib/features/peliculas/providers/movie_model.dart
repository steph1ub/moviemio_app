

class Movie{
 final String title;
 final String overview;
 final String posterPath; 
 final String backdropPath;

  Movie({required this.title, required this.overview, required this.posterPath, required this.backdropPath});

factory Movie.fromMap(Map<String, dynamic> map){
  return Movie(
    title: map['title'],
    overview: map['overview'],
    posterPath: map['poster_path'],
    backdropPath: map['backdrop_path'],
  );
  }

Map<String, dynamic> toMap(){
  return {
    'title': title,
    'overview': overview,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
  };
}

}