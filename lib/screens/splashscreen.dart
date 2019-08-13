import 'package:flutter/material.dart';

//import 'home_widget.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  /*
  loadWidget() async{
    return await new Future<Widget>.delayed(
        Duration(
            seconds: 3
        ),() => Home()
    ) ;
  }
  */

  /*
  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(seconds: 3),(){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          )
        );
      }
    );
  }
  */

  startTime() async {
    return Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacementNamed('/walkthrough')
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        children: <Widget>[
          Center(
            child: LogoImage(),
          ),
          Center(
            child: StarsImage(),
          )
        ],

        ),
      );
  }
}

class StarsImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('assets/screensplash/stars.png');
    Image image = Image(image: assetImage);
    return Container(child: image,);
  }

}

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('assets/screensplash/logo.png');
    Image image = Image(image: assetImage);
    return Container(child: image,);
  }
}