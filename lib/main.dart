import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Scaffold Demo',
      home: HomePage(
        title: 'Scaffold Home',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Icon heart = const Icon(
    Icons.favorite_border,
    color: Colors.white,
  );
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: (){like();},
              icon: heart
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){like();},
        backgroundColor: Colors.red,
        // label: const Text('Like'),
        child: heart
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: SizedBox(
          height: 5,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.arrow_back, color: Colors.white,)
              ),
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.camera_alt_rounded, color: Colors.white,)
              )
            ],
          ),
        ),
      ),
    );
  }

  void like() {
    setState(() {
      if (isLiked) {
        heart = const Icon(
          Icons.favorite_border,
          color: Colors.white,
        );
        isLiked = false;
      } else {
        heart = const Icon(
          Icons.favorite,
          color: Colors.white,
        );
        isLiked = true;
      }
    });
  }
}
