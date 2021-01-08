import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Components.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;

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
                  obscureText: false,
                  padding: kPadding,
                  border: kBorder,
                  enabledBorder: kEnabledBorder,
                  focusedBorder: kFocusedBorder,
                  onChange: (value) {
                    email = value.toString().trim();
                  },
                  hintText: 'Enter your Email'),
              SizedBox(
                height: 8.0,
              ),
              InputTextField(
                padding: kPadding,
                border: kBorder,
                enabledBorder: kEnabledBorder,
                focusedBorder: kFocusedBorder,
                hintText: 'Enter your password',
                obscureText: true,
                onChange: (value) {
                  password = value.toString().trim();
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RectangularRoundedButton(
                  materialAccentColor: materialAccentColor1,
                  buttonString: 'Register',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      showSpinner = false;
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
