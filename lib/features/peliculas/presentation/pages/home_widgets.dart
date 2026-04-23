import 'package:flutter/material.dart';

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({super.key});

  @override

  Widget build(BuildContext context) => ListView(
    padding: EdgeInsets.all(20),
    children: [
      buildMainCard(), buildBackgroundCard(), buildMenuCard(), buildMovieCard(),
    ],
  );

Widget buildMainCard() {

return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
buildBoxCard('All' ),
buildBoxCard('Movies' ),
buildBoxCard('Series')
],

);

}

Widget buildBoxCard(String title) => Card(
child: Container(
  decoration: BoxDecoration(
    color: Colors.blue.shade50,
    borderRadius: BorderRadius.circular(20), // Rounded corners
  ) ,
width: 130,
height: 30,
alignment: Alignment.center,
child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade900),),
),
);





  Widget buildBackgroundCard() => Card(
    child: Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset('assets/images/mainbkg.png').image,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );}

Widget buildMenuCard() => Card(
  
  child: SizedBox(
    height: 70,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Categories', style: TextStyle(fontSize: 12),),
        buildCategories(),
      ],
    ),
  ),
);



Widget buildCategories() { 
  final categories = ['Action', 'Comedy', 'Drama', 'Horror', 'Sci-Fi'];
  
  return Wrap(
  spacing: 8.0, // Gap between adjacent chips
  runSpacing: 4.0, // Gap between lines
  children: categories.map((category) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blueAccent),
      borderRadius: BorderRadius.circular(20), // Rounded corners
    ),
    child: Text(
      category,
      style: const TextStyle(color: Colors.blueAccent, fontSize: 13),
    ),
  )).toList(),
);


}

Widget buildMovieCard() {
  
  
  return Row(
    
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
    children: [
      
      buildMovieItem('assets/images/future.png'),
      buildMovieItem('assets/images/mario.png'),
      buildMovieItem('assets/images/matrix.png'),
      buildMovieItem('assets/images/unk.png'),
    ],
  );
}

Widget buildMovieItem(String imagePath) => Container(
  width: 100,
  height: 150,
 
  decoration: BoxDecoration(
    
    borderRadius: BorderRadius.circular(10),
    image: DecorationImage(
      image: Image.asset(imagePath).image,
      fit: BoxFit.cover,
    ),
  ),
);