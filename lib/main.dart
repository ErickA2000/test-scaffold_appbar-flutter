import 'dart:io';

import 'package:flutter/cupertino.dart';
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
  int elementButtonIndex = 0;
  String viewText = '0 : Home';

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? cupertino() : material();
  }

  Widget material(){
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
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Text(
                  'Menu drawer',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            Text('Link 1'),
            Text('Link 2'),
            Text('Link 3')
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(viewText,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){like();},
          backgroundColor: Colors.red,
          label: const Text('Like'),
          icon: heart
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: 'User',
              icon: Icon(Icons.supervised_user_circle)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              label: 'Statistics')
        ],
        currentIndex: elementButtonIndex,
        onTap: pulseItem,
      ),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
      ),*/
    );
  }

  Widget cupertino(){
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle_outlined),
                label: 'User'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book')
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('$index : Home')],
                    ),
                  ),
                );
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('$index : Account')],
                    ),
                  ),
                );
              });
            default:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('$index : Book')],
                    ),
                  ),
                );
              });
          }
        });
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

  void pulseItem(int index){
      setState(() {
        elementButtonIndex = index;

        switch(elementButtonIndex){
          case 0:
            viewText = '$elementButtonIndex : Home';
            break;
          case 1:
            viewText = '$elementButtonIndex : Account';
            break;
          case 2:
            viewText = '$elementButtonIndex : Statistics';
            break;
        }
      });
  }
}
