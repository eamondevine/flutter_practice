import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:coffee_card/services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //anon
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Coffee Crew'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/signin');
            },
            label: Text('Sign in', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize
                          .min, // Keeps box tight around its content
                      children: const [
                        Icon(Icons.email, color: Colors.black),
                        SizedBox(width: 8.0),
                        Text(
                          'Register with email',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Enter password 6+ chars long';
                      }
                      return null;
                    },
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.pink),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Please enter a valid email';
                            });
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 150.0),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'You can also just sign in anonymously',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Sign in Anon'),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    log('error signing in');
                  } else {
                    log('login successful');
                    log(result.uid);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
