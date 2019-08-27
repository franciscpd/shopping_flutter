import 'package:flutter/material.dart';
import 'package:shopping/pages/signup.page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 80,
            left: 20,
            right: 20,
            bottom: 40,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 475,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black12,
                        offset: new Offset(1, 2.0),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "Welcome",
                                  style: Theme.of(context).textTheme.display2,
                                ),
                                Text(
                                  "Sign in to continue",
                                  style: Theme.of(context).textTheme.subhead,
                                ),
                              ],
                            ),
                            FlatButton(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage()),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Invalid Email';
                            }

                            return null;
                          },
                          onSaved: (input) => _email = input,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Invalid Password';
                            }

                            return null;
                          },
                          onSaved: (input) => _password = input,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 40,
                          child: FlatButton(
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: FlatButton(
                            child: Text(
                              "Sign In",
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                print(_email);
                                print(_password);

                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Welcome, $_email'),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  child: Text(
                    "- OR -",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FlatButton(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 100,
                          child: Image.asset("assets/facebook.png"),
                        ),
                        Text("Sign In with Facebook"),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FlatButton(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 24,
                          width: 100,
                          child: Image.asset("assets/google.png"),
                        ),
                        Text("Sign In with Google"),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
