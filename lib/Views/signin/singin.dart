import 'package:flutter/material.dart';
import 'package:scholarb/utils/style.dart';
import 'package:scholarb/views/widgets/logo.dart';

class Singin extends StatefulWidget {
  @override
  _SinginState createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;

  String _email;

  String _password;

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Widget emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "EMAIL",
            style: TextStyle(
                fontWeight: w400,
                color: midgrayColor,
                fontSize: 12,
                letterSpacing: 1.1),
          ),
        ),
        Container(
          height: 46,
          decoration: BoxDecoration(
              color: inputsColor, borderRadius: BorderRadius.circular(7)),
          child: Center(
            child: TextFormField(
              validator: validateEmail,
              onSaved: (String value) {
                _email = value;
              },
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(7)))),
            ),
          ),
        )
      ],
    );
  }

  Widget passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "PASSWORD",
            style: TextStyle(
                fontWeight: w400,
                color: midgrayColor,
                fontSize: 12,
                letterSpacing: 1.1),
          ),
        ),
        Container(
          height: 46,
          decoration: BoxDecoration(
              color: inputsColor, borderRadius: BorderRadius.circular(7)),
          child: Center(
            child: TextFormField(
              validator: validatePassword,
              onSaved: (String value) {
                _password = value;
              },
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(7)))),
            ),
          ),
        )
      ],
    );
  }

  String validateUsername(String arg) {
    if (arg.length < 3) {
      return "Name must be more than 2 charater";
    }
    return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String arg) {
    if (arg.length < 6) {
      return "Password must be more than 5 charater";
    }
    return null;
  }

  void validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print([_email, _password]);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                logo(),
                SizedBox(
                  height: 67,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("SIGN IN",
                        style: TextStyle(
                            fontFamily: montserrat,
                            fontSize: 28,
                            fontWeight: w300)),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  onChanged: () => print(usernameController.text),
                  autovalidate: _autoValidate,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      emailField(),
                      SizedBox(
                        height: 30,
                      ),
                      passwordField(),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            onPressed: validateInputs,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 12,
                                  fontWeight: w500),
                            ),
                            color: mainColor,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "don't have an Account ?  ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: w500,
                                    fontFamily: montserrat),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed("/signup");
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
