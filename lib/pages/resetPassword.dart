import 'package:flutter/material.dart';
import 'package:curhatin/components/themeApp.dart';
import 'package:curhatin/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatefulWidget {
  final User user;
  ResetPasswordPage({this.user});
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _passwordController = TextEditingController();
  var _newPasswordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  bool checkCurrentPasswordValid = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              ThemeApp(),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          semanticLabel: "Setting",
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Text(
                        "Setting",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
            ],
          ),
          Card(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
                        ),
                        Divider(
                          color: Colors.grey[800],
                          height: 10,
                        ),
                        gantiPassword(),
                        SizedBox(height: 10,)
                      ]))),
          SizedBox(height: 20,),
          RaisedButton(
            onPressed: () async {
              checkCurrentPasswordValid =
              await validateCurrentPassword(_passwordController.text);

              if (_formKey.currentState.validate() && checkCurrentPasswordValid
                  && _newPasswordController.text.length > 5) {
                var firebaseUser = await _auth.currentUser();
                firebaseUser.updatePassword(_newPasswordController.text);
                Navigator.pop(context);
              }
            },
            color: Color(0xFF17B7BD),
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  80.0,
                )),
            child: Text("Update Password"),
          )
        ],
      ),
    );
  }

  Future<bool> validateCurrentPassword(String password) async {
    var firebaseUser = await _auth.currentUser();

    var authCredentials = EmailAuthProvider.getCredential(
        email: firebaseUser.email, password: password);
    try {
      var authResult = await firebaseUser
          .reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Widget gantiPassword() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: 'Password',
                errorText: checkCurrentPasswordValid
                    ? null
                    : "Please double check your current password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "New Password",
                labelText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
              validator: (input) {
                if (input.length < 6) {
                  return 'Your new password needs to be at least 6 characters';
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: TextFormField(
              controller: _repeatPasswordController,
              obscureText: true,
              validator: (value) {
                return _newPasswordController.text == value
                    ? null
                    : "Please validate your entered password";
              },
              decoration: InputDecoration(
                hintText: "Repeat New Password",
                labelText: 'Repeat New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
