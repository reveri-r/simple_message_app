import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "appName",
      home: Skeleton(),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: homeScreen(),
    );
  }
}

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<messageBaloon> messageList = [];
  TextEditingController t1 = TextEditingController();
  addToList(String recieveMessage) {
    setState(() {
      messageBaloon messageItem = messageBaloon(message: recieveMessage);
      messageList.insert(0, messageItem);
      t1.clear();
    });
  }

  Widget messageSender() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
            onPressed: () => addToList(t1.text),
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                reverse: true,
                itemCount: messageList.length,
                itemBuilder: (_, indexValue) => messageList[indexValue]),
          ),
          Divider(
            thickness: 1,
          ),
          messageSender(),
        ],
      ),
    );
  }
}

String name = "user1";

class messageBaloon extends StatelessWidget {
  String message;

  messageBaloon({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(name[0]),
          ),
          messagesSide(),
        ],
      ),
    );
  }

  Widget messagesSide() {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(name),
          Text(message),
        ],
      ),
    );
  }
}
