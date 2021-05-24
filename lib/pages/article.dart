import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
  final DocumentSnapshot detail;
  final String date;
  ArticlePage({this.detail, this.date});
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                  "assets/images/logo1.png",
                  height: 40,
                  color: Colors.white
              ),
              Text(
                ' | Psikoinfo',
                style: TextStyle(
                    fontFamily: "OpenSans-Bold"
                ),
              )
            ],
          ),
          backgroundColor: Color(0xFF17B7BD),
        ),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.detail.data['title'],
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Montserrat-Bold"
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "By: ${widget.detail.data['uploadedBy']}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "OpenSans-Regular"
                        ),
                      ),
                      Text(
                        "${widget.date}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "OpenSans-Regular",
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.network(
                    widget.detail.data['photoUrl'],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text(
                    widget.detail.data['content'],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "OpenSans-Regular",
                      height: 1.5
                    ),
                  ),
                ),
                SizedBox(height: 50,)
              ],
            )
        )
    );
  }
}
