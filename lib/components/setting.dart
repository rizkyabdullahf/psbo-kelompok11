import 'package:curhatin/pages/editProfile.dart';
import 'package:flutter/material.dart';
import 'package:curhatin/pages/resetPassword.dart';
import 'package:curhatin/pages/editProfile.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 30, 20,  20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              Padding(
//                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                  child: Row(
//                    children: [
//                      Expanded(
//                        flex: 4,
//                        child: Text(
//                          'Push Notifications',
//                          style: TextStyle(fontSize: 15),
//                        ),
//                      ),
//                      Expanded(
//                        flex: 1,
//                        child: Switch(
//                          value: val,
//                          onChanged: (bool e) => switchButton(e),
//                          activeColor: Colors.greenAccent,
//                        ),
//                      )
//                    ],
//                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => EditProfile())
                    );},
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width/50),
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 10,),
                        Text(
                            "Edit Profile",
                            textScaleFactor: 0.9
                        )
                      ],
                    ),
                  )
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ResetPasswordPage())
                    );},
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width/50),
                    child: Row(
                      children: [
                        Icon(Icons.vpn_key),
                        SizedBox(width: 10,),
                        Text(
                            "Reset Password",
                            textScaleFactor: 0.9
                        )
                      ],
                    ),
                  )
              ),
            ]
        ),
      ),
    );
  }

//  void switchButton(bool e){
//    setState(() {
//      if(e) {
//        val = true;
//        e = true;
//      } else {
//        val = false;
//        e = false;
//      }
//    });
//  }
}
