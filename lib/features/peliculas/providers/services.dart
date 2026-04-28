import 'package:http/http.dart' as http;
import 'dart:convert';  
import '../providers/movie_model.dart';

const apiKey = 'e85a322641862cd1f6caffa06a16719a';

class ApiService {
  final upComingMoviesUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=es-ES&page=1';
  final popularMoviesUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  final topRatedMoviesUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=es-ES&page=1';

Future<List<Movie>> getUpcomingMovies() async {
  final response = await http.get(Uri.parse(upComingMoviesUrl));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['results'];

    //final data = jsonDecode(response.body);
    //final List movies = data['results'];

List<Movie> upcomingMovies = data.map((movie) => Movie.fromMap(movie)).toList();

    return upcomingMovies;
  } else {
    throw Exception('Failed to load upcoming movies');
  }
}

Future<List<Movie>> getPopularMovies() async {
  final response = await http.get(Uri.parse(popularMoviesUrl));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['results'];
    List<Movie> popularMovies = data.map((movie) => Movie.fromMap(movie)).toList();

    return popularMovies;
  } else {
    throw Exception('Failed to load popular movies');
  }}

Future<List<Movie>> getTopRatedMovies() async {
  final response = await http.get(Uri.parse(topRatedMoviesUrl));  
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['results'];
    List<Movie> topRatedMovies = data.map((movie) => Movie.fromMap(movie)).toList();

    return topRatedMovies;
  } else {
    throw Exception('Failed to load top rated movies');
  }

}

}