import 'package:flutter/material.dart';
import 'package:moviemio_app/features/peliculas/providers/services.dart';


class MovieDetailsScreen extends StatelessWidget {
  final dynamic movie; // Recibe el objeto película

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F111D),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService().getMovieDetails(movie.id), 
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          final genres = (data['genres'] as List).map((g) => g['name']).join(', ');
          final releaseYear = DateTime.parse(data['release_date']).year.toString();
          
          // Buscar al director en la lista de crew
          final crew = data['credits']['crew'] as List;
          final director = crew.firstWhere(
            (person) => person['job'] == 'Director',
            orElse: () => {'name': 'No disponible'},
          )['name'];

          return CustomScrollView(
            slivers: [
              _buildAppBar(movie.posterPath),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        
                        // Fila de Info Rápida
                        Row(
                          children: [
                            _infoTile(Icons.movie, genres.split(',')[0]), // Primer género
                            const SizedBox(width: 15),
                            _infoTile(Icons.person, director), // Director
                            const SizedBox(width: 15),
                            _infoTile(Icons.star, movie.voteAverage.toString()), // Rating
                          ],
                        ),

                        const SizedBox(height: 25),
                        const Text("Sinopsis", style: TextStyle(color: Colors.blueAccent, fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(
                          movie.overview,
                          style: const TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                        ),
                        
                        const SizedBox(height: 25),
                        const Text("Géneros", style: TextStyle(color: Colors.blueAccent, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(genres, style: const TextStyle(color: Colors.white)),

                        const SizedBox(height: 25),
                        const Text("Año de Estreno", style: TextStyle(color: Colors.blueAccent, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(releaseYear, style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  // Widget auxiliar para el AppBar
  Widget _buildAppBar(String path) {
    return SliverAppBar(
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network('https://image.tmdb.org/t/p/w500$path', fit: BoxFit.cover),
      ),
    );
  }

  // Widget auxiliar para etiquetas (Director, Género)
  Widget _infoTile(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 16),
          const SizedBox(width: 5),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}