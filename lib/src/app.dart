import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  //build method is always required to be defined inside statelesswidget
  //the build method returns a widget
  Widget build(context) {
    return MaterialApp(
      title: 'Log me In',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
