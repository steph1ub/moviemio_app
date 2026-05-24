import 'package:http/http.dart' as http;
import 'package:moviemio_app/features/peliculas/providers/movie_detail.dart';
import 'dart:convert';  
import '../providers/movie_model.dart';


const apiKey = 'e85a322641862cd1f6caffa06a16719a';

class ApiService {
  final upComingMoviesUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=es-ES&page=1';
  final popularMoviesUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  final topRatedMoviesUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=es-ES&page=1';
  final movieDetailUrl = 'https://api.themoviedb.org/3/movie/{movie_id}?api_key=$apiKey&language=es-ES';
  final movieCreditsUrl = 'https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=$apiKey&language=es-ES';

// Función para obtener películas próximas a estrenarse 
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

// Función para obtener películas populares
Future<List<Movie>> getPopularMovies() async {
  final response = await http.get(Uri.parse(popularMoviesUrl));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['results'];
    List<Movie> popularMovies = data.map((movie) => Movie.fromMap(movie)).toList();

    return popularMovies;
  } else {
    throw Exception('Failed to load popular movies');
  }}

// Función para obtener películas mejor valoradas
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

// función para obtener detalles de una película específica 
Future<MovieDetail> getMovieDetail(int movieId, dynamic movieDetailUrl) async {
  final url = movieDetailUrl.replaceFirst('{movie_id}', movieId.toString());
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return MovieDetail.fromJson(data);
  } else {
    throw Exception('Failed to load movie details');
  }
}

// Función para obtener direcotores y generos de una película específica
Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&append_to_response=credits'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Error al cargar detalles');
  }
}
}
