import 'package:curhatin/services/test.dart';
import 'package:curhatin/setup/test.dart';
import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  final TestCount count = TestCount('10');
  final String test = 'Hello';
  // var tets = 123;

  @override
  Widget build(BuildContext context) {
    return Container(child: RaisedButton(
      onPressed: () {
        count.count;
      },
    ));
  }

  void hello() {
    print('Hello');
  }

  sayHello<String>() {
    if (test == 'Hello') {
      return 'Party';
    }
  }
}
