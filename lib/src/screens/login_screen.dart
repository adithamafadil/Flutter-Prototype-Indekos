import 'package:flutter/material.dart';
import 'package:indekosapp/src/theme/constant_colors.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  String _username, _password = "";
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .25),
                  child: FlutterLogo(size: 140),
                ),
                SizedBox(height: 36.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "E.g. Admin",
                        ),
                        onChanged: (String username) {
                          setState(() {
                            _username = username;
                          });
                        },
                      ),
                      SizedBox(height: 24.0),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "E.g. admin123",
                          suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(
                              _obscureText
                                  ? Icons.lock_outline
                                  : Icons.lock_open,
                            ),
                          ),
                        ),
                        onChanged: (String password) {
                          setState(() {
                            _password = password;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.0),
                Builder(
                  builder: (context) => RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "Log In",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        if (_username == "Admin" && _password == "admin123") {
                          print('object');
                        } else if (_username == "User" &&
                            _password == "user123") {
                          Navigator.pushNamed(context, '/home');
                        } else {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Maaf, Username Atau Password Anda Salah",
                              ),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      });
                    },
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
