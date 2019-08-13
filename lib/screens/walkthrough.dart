import 'dart:math';

import 'package:book_app/screens/register.dart';
import 'package:flutter/material.dart';

class AppTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: AppTutorialBody(),
      /*bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text("Sign In"),
            icon: null,
          ),
          BottomNavigationBarItem(
            title: Text("Register"),
            icon: null,
          ),
        ],
      ),
      */
    );
  }
}

class AppTutorialBody extends StatefulWidget {
  AppTutorialBody({Key key}) : super(key: key);

  @override
  AppTutorialBodyState createState() => AppTutorialBodyState();
}

class AppTutorialBodyState extends State<AppTutorialBody> {
  PageController _pageController; //PageController class
  CrossFadeState _bottomState = CrossFadeState.showFirst; //CrossFadeState enum

  //State<T extends StatefulWidget> > initState method
  //@override
  void initState() {
    super.initState();
    _pageController = PageController();
    //ChangeNotifier > addListener method
    _pageController.addListener(_pageListener);
  }

  //SingleTickerProviderStateMixin<T extends StatefulWidget> -> dispose method
  @override
  void dispose() {
    super.dispose();
    //ChangeNotifier > removeListener method
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
  }

  void _pageListener() {
    //ScrollController > hasClients property
    if (_pageController.hasClients) {
      //PageController > page property
      //PageController > initialPage property
      //Si _pageController.page no es nulo, devuelve su valor; de lo contrario,
      // evalúa y devuelve el valor de _pageController.initialPage.
      double page = _pageController.page ?? _pageController.initialPage;
      setState(() {
        if (page >= 1.5) {
          _bottomState = CrossFadeState.showSecond; //CrossFadeState enum
        } else {
          _bottomState = CrossFadeState.showFirst;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Stack class
    return Stack(
      fit: StackFit.expand, //Stack > fit property
      children: <Widget>[
        //TODO: CrossFade Screens
        PageView.builder(
          //PageView > PageView.builder constructor
          controller: _pageController,
          itemCount: pages.length,
          //IndexedWidgetBuilder typedef
          itemBuilder: (BuildContext context, int index) {
            //Column class
            return Column(
              //Flex > crossAxisAlignment property
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //TODO: Skip Button
                Container(
                  height: 100.0,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: 340),
                  child: InkWell(
                    //color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Skip',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'OpenSans'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    //onPressed: () {},
                  ),
                ),
                //SizedBox class
                SizedBox(height: 40.0),
                //TODO: Central Image
                Center(
                  child: Container(
                      width: 200.0,
                      height: 200.0,
                      child: Image.asset(pages[index].assetImagePath)),
                ),
                //TODO: First Central Text
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 60.0, right: 60.0, bottom: 30.0),
                  child: Text(
                    pages[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0),
                  ),
                ),
                //TODO: Second Central Text under First Text
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 40.0, right: 40.0, bottom: 100.0),
                  child: Text(
                    pages[index].text_2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0),
                  ),
                )
              ],
            );
          },
        ),
        //TODO: Dots Carousel
        Align(
          //alignment: Alignment.center,
          child: Container(
            height: 400.0,
            child: PageIndicators(
              pageController: _pageController,
            ),
          ),
        ),
        //TODO: Log in & Register
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 19.0,),
                    onPressed: () {},
                    color: Colors.white,
                    child: Text("Log in",
                      style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 19.0,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => RegisterScreen()));
                  },
                  color: Colors.white,
                  child: Text("Register",
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//TODO: PageIndicators (Contents: Skip and Dots)
class PageIndicators extends StatelessWidget {
  final PageController pageController;

  const PageIndicators({Key key, this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //TODO: Dots Carousel
        Align(
          alignment: Alignment.bottomCenter,
          child: PageViewIndicator(
            controller: pageController,
            pageCount: 3,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

//TODO: Page Model (Second Part)
class PageModel {
  final String assetImagePath;
  final String text;
  final String text_2;

  PageModel({this.assetImagePath, this.text, this.text_2});
}

List<PageModel> pages = [
  PageModel(
    assetImagePath: 'assets/First.png',
    text: 'Text Input',
    text_2: 'Text Input',
  ),
  PageModel(
    assetImagePath: 'assets/walkthrough/walk1.png',
    text: 'Increase Your knowledge',
    text_2: "You can't fail if you don't climb. "
        "But there's no joy in living your whole life on the ground.",
  ),
  PageModel(
    assetImagePath: 'assets/Third.png',
    text: 'Text Input',
    text_2: 'Text Input',
  )
];

//TODO: Page View Indicator (Third Part: Carousel Dots)
class PageViewIndicator extends StatefulWidget {
  PageViewIndicator({
    this.controller,
    this.pageCount,
    this.color: Colors.lightBlueAccent,
  });

  final PageController controller;

  final int pageCount;

  final Color color;

  static const double _indicatorSize = 7.0;

  static const double _indicatorZoom = 1.2;

  static const double _indicatorSpacing = 15.0;

  @override
  PageViewIndicatorState createState() => PageViewIndicatorState();
}

class PageViewIndicatorState extends State<PageViewIndicator> {
  double _page = 0.0;

  void initState() {
    super.initState();
    widget.controller.addListener(_pageListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    if (widget.controller.hasClients) {
      setState(() {
        _page = widget.controller.page ?? widget.controller.initialPage;
      });
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.pageCount, _buildDot),
    );
  }

  Widget _buildDot(int index) {
    //animation > Curves class
    double selectedness = Curves.easeOut.transform(
      max(0.0, 1.0 - (_page - index).abs()),
    );
    double zoom = 1.0 + (PageViewIndicator._indicatorZoom - 1.0) * selectedness;

    return Container(
      width: PageViewIndicator._indicatorSpacing,
      child: Material(
        color: widget.color,
        type: MaterialType.circle,
        child: SizedBox(
          width: PageViewIndicator._indicatorSize * zoom,
          height: PageViewIndicator._indicatorSize * zoom,
        ),
      ),
    );
  }
}
