import 'dart:developer';

import 'package:coffee_card/services/auth.dart';
import 'package:coffee_card/shared/constants.dart';
import 'package:coffee_card/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

//anon state
class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign In to Coffee Crew'),
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.person, color: Colors.black),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  label: Text(
                    'Register',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 50.0,
                  ),
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
                                'Sign in with your email',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Email',
                          ),
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
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Password',
                          ),
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
                              backgroundColor: WidgetStateProperty.all(
                                Colors.pink,
                              ),
                            ),
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                dynamic result = await _auth
                                    .signInWithEmailAndPassword(
                                      email,
                                      password,
                                    );
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Could not sign in with those credentials';
                                    loading = false;
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
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 50.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text('Sign in Anon'),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInAnon();
                        if (result == null) {
                          setState(() {
                            loading = false;
                          });
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
