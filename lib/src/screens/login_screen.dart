import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  //create new class LoginScreenState
  //extend all functiionality from state based class
  //use all the methods coming from validationmixin inot loginscreenstate
  //which means inside the LoginScreenState we can freely reference functions created in validation_mixin.dart
  final formKey = GlobalKey<FormState>();

  //we reference formState instead of Form is because the data entered is stored in formstate everytime the form rerenders
  //like in a statefulwidget

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(50.7),
      child: Form(
        key: formKey, //associating the key with formwidget
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 28.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }
//helper methods so that things don't look cramed and difficult to work with

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      //we don't have to create an instance of TextInputType() becaues we are r
      //referencing constant value to it
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      //no parenthesis in validateEmail as we don't want to invoke the function
      //we want to pass reference of validaeEmail to validator
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true, //to display * in place of pw
      decoration: InputDecoration(
        labelText: 'Enter Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue[100],
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          //this is a refernce to formstate object above

          print('Regestering $email and $password');
        }
      },
      //whenever RaisedButton is used, onPressed callback is required
    );
  }
}
