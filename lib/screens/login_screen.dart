import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/Components.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool showSpinner = false;

  @override
  void dispose() {
    super.dispose();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              InputTextField(
                padding: kPadding,
                border: kBorder,
                enabledBorder: kEnabledBorder,
                focusedBorder: kFocusedBorder,
                hintText: 'Enter Your Email',
                obscureText: false,
                onChange: (value) {
                  email = value.toString().trim();
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              InputTextField(
                padding: kPadding,
                border: kBorder,
                enabledBorder: kEnabledBorder,
                focusedBorder: kFocusedBorder,
                hintText: 'Enter Your Password',
                obscureText: true,
                onChange: (value) {
                  password = value.toString().trim();
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RectangularRoundedButton(
                materialAccentColor: materialAccentColor,
                buttonString: 'Log In',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (FirebaseAuth.instance.currentUser != null) {
                    Toast.show("Login Successful", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    Navigator.pushNamed(context, ChatScreen.id);
                    setState(() {
                      showSpinner = false;
                    });
                  } else {
                    Toast.show("Failed", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    print('Failed');
                  }
                  showSpinner = false;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
