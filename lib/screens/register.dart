import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Register(),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _Register createState() => new _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  //TODO: Logo Icon
                  Container(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      child: Image.asset('assets/little_logo.png'),
                      height: 100,
                    ),
                    margin: EdgeInsets.only(left: 30, top: 20),
                  ),
                  //TODO: Sign in Button
                  Container(
                    height: 110.0,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left: 330),
                    child: InkWell(
                      //color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'OpenSans'),
                          ),
                        ],
                      ),
                      //onPressed: () {},
                    ),
                  ),
                  //TODO: First Text
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 125.0, 0.0, 0.0),
                    child: Text(
                      'Welcome Back,',
                      style: TextStyle(
                          fontSize: 37.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //TODO: Second Text
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 180.0, 0.0, 0.0),
                    child: Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
              child: Column(
                children: <Widget>[
                  //TODO: Input Username
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      icon: Icon(Icons.account_circle),
                      labelStyle: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  //TODO: Input E-mail
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      icon: Icon(Icons.email),
                      labelStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  //TODO: Input Password
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      icon: Icon(Icons.lock_outline),
                      labelStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 70.0,
                    padding:
                        EdgeInsets.only(top: 20.0, left: 60.0, right: 60.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(5.0),
                      //shadowColor: Colors.greenAccent,
                      color: Colors.pink,
                      //elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'By creating account you agree\n to our',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'OpenSans'),
                ),
                //SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Terms & Conditions',
                    style: TextStyle(
                        color: Colors.pink,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
      body: Column(
        children: <Widget>[
          Container(
            child: SizedBox(
              child: Image.asset('assets/images/logo.jpg'),
              height: 90,
            ),
            margin: EdgeInsets.only(left: 15, top: 115),
          ),

          Container(
            height: 90.0,
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

        ],
      ),

    );
  }
*/
