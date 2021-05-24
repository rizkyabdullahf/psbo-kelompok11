import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curhatin/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PushNotifications {
  final String userUid;
  PushNotifications({this.userUid});
  final FirebaseMessaging _fcm = FirebaseMessaging();
  // ignore: missing_return
  Future initialize() {
    _fcm.configure(
      // when app is on foreground and we reciever push notification
      onMessage: (Map<String, dynamic> message) async {
        print('on Message: $message');
      },
      // when app is close and it is opened
      onLaunch: (Map<String, dynamic> message) async {
        print('on Launch: $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on Resume: $message');
      },
    );

    _fcm.getToken().then((token) {
      print('token: $token');
      Firestore.instance
          .collection('users')
          .document(userUid)
          .updateData({'pushToken': token});
    }).catchError((err) {
      Fluttertoast.showToast(msg: err.message.toString());
    });
  }
}
