import 'package:flutter/material.dart';
import 'placeholder_widget.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.black)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Discover',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            print("Search");
            },
            color: Colors.grey,
          ),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
            print("Cart");
            },
            color: Colors.grey,
          ),
        ],
      ),


      body: _children[_currentIndex],


      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              title: Text('My Library')
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile')
            )
          ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}