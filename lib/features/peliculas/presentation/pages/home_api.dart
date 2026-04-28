import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
                
                Text('Próximamente', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade900,),),
           
                FutureBuilder(
                  future: upcomingMovies,
                builder: (context, snapshot){
                  if (!snapshot.hasData){ 
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  final movies = snapshot.data!;
           
                  return CarouselSlider.builder(itemCount: movies.length, itemBuilder: (context, index, realIndex){
                    final movie = movies[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.network('https://image.tmdb.org/t/p/w500${movie.backdropPath}', fit: BoxFit.cover,),
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

// popular movies
Text('Populares', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade900, ),),
                
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
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}', fit: BoxFit.cover,),
                          );
                          
                        },


                      );
                    },
                  ),

                ),
// top rated movies
 Text('Mejor valoradas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade900, ),),

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
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}', fit: BoxFit.cover,),
                          );
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
