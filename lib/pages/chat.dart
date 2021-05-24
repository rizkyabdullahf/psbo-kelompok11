import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curhatin/models/user.dart';
import 'package:curhatin/models/usersChat.dart';
import 'package:curhatin/tabRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:swipe_to/swipe_to.dart';

class ChatPage extends StatefulWidget {
//  final String admin;
  @override
  _ChatPageState createState() => _ChatPageState();
  final UsersChat recieverData;
  ChatPage({this.recieverData});
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool isLoading;

  // SharedPreferences preferences;

  String chatId;
  User senderData;
  String replyMessage;
  String replyId;
  var listMessage;

  void replyToMessage(id, message) {
    print('jalan gk');
    print(message);
    setState(() {
      replyId = id;
      replyMessage = message;
    });
  }

  void cancelReply() {
    setState(() {
      replyId = null;
      replyMessage = null;
    });
  }

  @override
  void initState() {
    super.initState();
    isLoading = false;
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    senderData = Provider.of<User>(context, listen: false);
    // });
    print('Sender Data =');
    print(senderData);
    getChatId();
  }

  getChatId() async {
    if (senderData.uid.hashCode <= widget.recieverData.uid.hashCode) {
      chatId = '${senderData.uid}-${widget.recieverData.uid}';
    } else {
      chatId = '${widget.recieverData.uid}-${senderData.uid}';
    }
    // var list = List<String>;

    await Firestore.instance
        .collection('users')
        .document(widget.recieverData.uid)
        .updateData({
      'isChattingWith': FieldValue.arrayUnion([
        {'id': senderData.uid}
      ])
    });

    await Firestore.instance
        .collection('users')
        .document(senderData.uid)
        .updateData({
      'isChattingWith': FieldValue.arrayUnion([
        {'id': widget.recieverData.uid}
      ])
    });
  }

  void onMessageSent(String contentMsg) {
    if (contentMsg != null) {
      textEditingController.clear();
      var docRef = Firestore.instance
          .collection('messages')
          .document(chatId)
          .collection(chatId)
          .document(DateTime.now().millisecondsSinceEpoch.toString());

      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(docRef, {
          "idFrom": senderData.uid,
          "replyMessage": replyMessage ?? '',
          "replyId": replyId ?? '',
          "idTo": widget.recieverData.uid,
          "timeStamp": DateTime.now().millisecondsSinceEpoch.toString(),
          "content": contentMsg,
        });
        scrollController.animateTo(0.0,
            duration: Duration(microseconds: 300), curve: Curves.easeOut);
        cancelReply();
      });
    } else {
      Fluttertoast.showToast(msg: 'You Can\'t send an empty message');
    }
  }

  Future deleteChat() async {
    try {
      await Firestore.instance
          .collection('users')
          .document(senderData.uid)
          .updateData({
        'isChattingWith': FieldValue.arrayRemove([
          {'id': widget.recieverData.uid}
        ])
      });
      print('chat id nya');
      print(chatId);
      await Firestore.instance
          .collection('messages')
          .document(chatId)
          .collection(chatId)
          .getDocuments()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.documents) {
          ds.reference.delete();
        }
      });
      await Firestore.instance
          .collection('users')
          .document(widget.recieverData.uid)
          .updateData({
        'isChattingWith': FieldValue.arrayRemove([
          {'id': senderData.uid}
        ])
      });
    } catch (e) {
      print('error bosq');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // var senderData = Provider.of<User>(context);

    createListMessages() {
      return Flexible(
          child: chatId == ''
              ? Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.lightBlueAccent)),
                )
              : StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('messages')
                      .document(chatId)
                      .collection(chatId)
                      .orderBy('timeStamp', descending: true)
                      .limit(20)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.lightBlueAccent)),
                      );
                    } else {
                      print('Chat Id =' + chatId);
                      listMessage = snapshot.data.documents;
                      print('List Messages');
                      print(listMessage);
                      return ListView.builder(
                        itemBuilder: (context, index) => SwipeTo(
                            onRightSwipe: () => replyToMessage(
                                snapshot?.data?.documents[index]['idFrom'],
                                snapshot?.data?.documents[index]['content']),
                            child: createItem(
                                index, snapshot?.data?.documents[index])),
                        itemCount: snapshot?.data?.documents?.length,
                        reverse: true,
                        controller: scrollController,
                      );
                    }
                  },
                ));
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: widget.recieverData.photoUrl == null
                    ? CircleAvatar(
                        backgroundColor: Color(0xFF17B7BD),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/user-boy.png'),
                          backgroundColor: Colors.white,
                          radius: 17.0,
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.recieverData.photoUrl),
                        backgroundColor: Colors.white,
                        radius: 20,
                      ),
              ),
              RichText(
                text: TextSpan(
                    text: widget.recieverData.name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.recieverData.role == 'admin'
                            ? '\n' + widget.recieverData.type
                            : '',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Delete Chat'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'Apakah anda yakin ingin delete chat ini?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Tidak'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('Iya'),
                                  onPressed: () async {
                                    deleteChat();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => TabRoutes()),
                                        (Route<dynamic> route) => false);
                                  },
                                ),
                              ]);
                        });
                  },
                  child: Icon(
                    Icons.delete,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: Column(
          // child: Stack(
          children: <Widget>[
            // Container(
            //   height: MediaQuery.of(context).size.height - 220,
            // ),
            createListMessages(),
            // input controllers
            replyMessage != null
                ? Container(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.recieverData.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    cancelReply();
                                  },
                                ),
                              )
                            ],
                          ),
                          Text(replyMessage,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFCCE5E2),
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: Color(0xFFE5F2F0)),
                  )
                : Container(),
            createInput(),
            // Text(widget.recieverData.uid),
          ],
          // ),
        ));
  }

  Widget createItem(int index, DocumentSnapshot documentSnapshot) {
    print(documentSnapshot['replyMessage']);
    if (documentSnapshot['idFrom'] == senderData.uid) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              isLastMsgRight(index)
                  ? Container(
                      child: Text(
                        DateFormat("dd MMM'\n'HH:mm").format(
                            DateTime.fromMillisecondsSinceEpoch(
                                int.parse(documentSnapshot['timeStamp']))),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      ),
                      margin: EdgeInsets.only(right: 10.0, bottom: 5.0),
                    )
                  : Container(
                      child: Text(
                        DateFormat("dd MMM'\n'HH:mm").format(
                            DateTime.fromMillisecondsSinceEpoch(
                                int.parse(documentSnapshot['timeStamp']))),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      ),
                      margin: EdgeInsets.only(right: 10.0, bottom: 5.0),
                    ),
              ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                  child: documentSnapshot['replyMessage'] != ''
                      ? Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      documentSnapshot['replyId'] !=
                                              senderData.uid
                                          ? widget.recieverData.name
                                          : "You",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF094328)),
                                    ),
                                    Text((documentSnapshot['replyMessage']),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black54,
                                        )),
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xFF64e8a6),
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                              Container(
                                child: Text(documentSnapshot['content']),
                                margin: EdgeInsets.fromLTRB(5, 3, 5, 0),
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Color(0xFF8FEEBF),
                              borderRadius: BorderRadius.circular(15.0)),
                          margin: EdgeInsets.only(
                            top: 8.0,
                            right: 10.0,
                          ),
                        )
                      : Container(
                          child: Text(documentSnapshot['content']),
                          padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          decoration: BoxDecoration(
                              color: Color(0xFF8FEEBF),
                              borderRadius: BorderRadius.circular(15.0)),
                          margin: EdgeInsets.only(
                            top: 8.0,
                            right: 10.0,
                          ),
                        )),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      );
    } else {
      return Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 3 / 4),
                    child: documentSnapshot['replyMessage'] != ''
                        ? Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        documentSnapshot['replyId'] !=
                                                senderData.uid
                                            ? widget.recieverData.name
                                            : "You",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF094328)),
                                      ),
                                      Text((documentSnapshot['replyMessage']),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black54,
                                          )),
                                    ],
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE6E6E6),
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                Container(
                                  child: Text(documentSnapshot['content']),
                                  margin: EdgeInsets.fromLTRB(5, 3, 5, 0),
                                )
                              ],
                            ),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15.0)),
                            margin: EdgeInsets.only(
                              top: 8.0,
                              right: 10.0,
                            ),
                          )
                        : Container(
                            child: Text(documentSnapshot['content']),
                            padding:
                                EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15.0)),
                            margin: EdgeInsets.only(
                              top: 8.0,
                              right: 10.0,
                            ),
                          )),
                isLastMsgLeft(index)
                    ? Container(
                        child: Text(
                          DateFormat("dd MMM'\n'HH:mm").format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(documentSnapshot['timeStamp']))),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontStyle: FontStyle.italic),
                        ),
                        margin: EdgeInsets.only(bottom: 5.0),
                      )
                    : Container(
                        child: Text(
                          DateFormat("dd MMM'\n'HH:mm").format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(documentSnapshot['timeStamp']))),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontStyle: FontStyle.italic),
                        ),
                        margin: EdgeInsets.only(bottom: 5.0),
                      ),
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(left: 10),
      );
    }
  }

  isLastMsgLeft(int index) {
    if ((index > 0 &&
            listMessage != null &&
            listMessage[index - 1]['idFrom'] == senderData.uid) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  isLastMsgRight(int index) {
    if ((index > 0 &&
            listMessage != null &&
            listMessage[index - 1]['idFrom'] != senderData.uid) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  createInput() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 70),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF17B7BD),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: TextField(
            style: TextStyle(
              color: Colors.white,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: new InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                color: Colors.white,
                onPressed: () => onMessageSent(textEditingController.text),
              ),
              contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              hintStyle: new TextStyle(color: Colors.white70, fontSize: 15),
              hintText: "Type Something...",
              fillColor: Colors.transparent,
            ),
            controller: textEditingController,
          ),
        ),
      ),
    );
  }
}
