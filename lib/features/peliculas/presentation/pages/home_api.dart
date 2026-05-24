import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/home_widgets.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/movie_details_page.dart';
import 'package:moviemio_app/features/peliculas/providers/movie_model.dart';
import 'package:moviemio_app/features/peliculas/providers/services.dart';



class HomeApi extends StatefulWidget {
  const HomeApi({super.key});

  @override
  State<HomeApi> createState() => _HomeApiState();
}

class _HomeApiState extends State<HomeApi> {

late Future<List<Movie>> upcomingMovies;
late Future<List<Movie>> popularMovies;
late Future<List<Movie>> topRatedMovies;

@override
void initState() {
upcomingMovies= ApiService().getUpcomingMovies();
popularMovies= ApiService().getPopularMovies();
topRatedMovies= ApiService().getTopRatedMovies();
  super.initState();
}

  @override

  

  Widget build(BuildContext context) {
    return Scaffold(
      
      body:
      
       Column(
         children: [
          
           SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: 
            
            
            Column( 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
                
              
                Text('Próximamente', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent,),),
                const SizedBox(height: 6),
           
                FutureBuilder(
                  future: upcomingMovies,
                builder: (context, snapshot){
                  if (!snapshot.hasData){ 
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  final movies = snapshot.data!;
           
                  return CarouselSlider.builder(itemCount: movies.length, itemBuilder: (context, index, realIndex){
                    final movie = movies[index];

return GestureDetector(
  onTap: () {
    // Navegar a la pantalla de detalles de la película
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie)),
    );
  },
child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),

                      child: Stack(
                        children: [
                         ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            //titulo de la pelicula
                            child: Text(movie.title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                     
                    )

);

                  }, options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16/9,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 0.9,
                  ));
                }),

 const SizedBox(height: 20),
buildCategories(),
 const SizedBox(height: 20),



// popular movies
Text('Populares', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent,),),
const SizedBox(height: 6),
                
                SizedBox(
                  height: 150,
                  child: FutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot){
                      if (!snapshot.hasData){ 
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      final movies = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index){
                          final movie = movies[index];

                          return GestureDetector(
                            onTap: () {
                              // Navegar a la pantalla de detalles de la película
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie)),
                              );
                            },
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child:Stack(
  children: [

    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        fit: BoxFit.cover,
        width: 100,
        height: 150,
      ),
    ),

    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(4),
        color: Colors.black.withValues(alpha: 0.7),
        child: Text(
          movie.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ],
),)
                          );
                          
                        },


                      );
                    },
                  ),

                ),
                const SizedBox(height: 10),
// top rated movies
 Text('Mejor valoradas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent, ),),
 const SizedBox(height: 6),

                SizedBox(
                  height: 150,
                  child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot){
                      if (!snapshot.hasData){ 
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      final movies = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index){
                          final movie = movies[index];

                          return GestureDetector(
                            onTap: () {
                              // Navegar a la pantalla de detalles de la película
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie)),
                              );
                            },
                          child: Container(
                          
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Stack(
  children: [

    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        fit: BoxFit.cover,
        width: 100,
        height: 150,
      ),
    ),

    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(4),
        color: Colors.black.withValues(alpha: 0.7),
        child: Text(
          movie.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ],
),
                          ));
                        },
                      );
                    },
                  ),
                ),

              ],
              
            ),
            
                 ),
         ],
       )
    );
  }
  
}
