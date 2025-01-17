/**
 * Author: Siddhartha Joshi
 * profile: https://github.com/cimplesid
  */

import 'package:flutter/material.dart';

class ChatUi extends StatelessWidget {
  static final String path = "lib/src/pages/misc/chatui.dart";

  @override
  Widget build(BuildContext context) {
    createTile(Friend friend) => Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFF565973), width: 1.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 6.0, 16.0, 6.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage(friend.image),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            friend.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            friend.msgTime,
                            style: TextStyle(
                              color: Colors.white30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        friend.message,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 42.0,
                      height: 42.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF414350),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: IconButton(
                        color: Color(0xFF5791FB),
                        icon: Icon(Icons.call),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      width: 42.0,
                      height: 42.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF414350),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: IconButton(
                        color: Color(0xFF5791FB),
                        icon: Icon(Icons.videocam),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

    final liste = SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: friends.map((book) => createTile(book)).toList(),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFF363846),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
            child: Text(
              'Chats',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF414350),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.0,
                    spreadRadius: -1.0,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      OnlinePersonAction(
                        personImagePath: 'assets/img/1.jpg',
                        actColor: Colors.greenAccent,
                      ),
                      OnlinePersonAction(
                        personImagePath: 'assets/img/backdrop.png',
                        actColor: Colors.yellowAccent,
                      ),
                      OnlinePersonAction(
                        personImagePath: 'assets/img/avatar.png',
                        actColor: Colors.redAccent,
                      ),
                      OnlinePersonAction(
                        personImagePath: 'assets/img/5.jpg',
                        actColor: Colors.yellowAccent,
                      ),
                      OnlinePersonAction(
                        personImagePath: 'assets/img/6.jpg',
                        actColor: Colors.greenAccent,
                      ),
                      OnlinePersonAction(
                        personImagePath: 'assets/img/7.jpg',
                        actColor: Colors.greenAccent,
                      ),
                      OnlinePersonAction(
                        personImagePath: 'assets/img/1.jpg',
                        actColor: Colors.greenAccent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Text(
              'Newsfeed',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search your friends...',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                  filled: true,
                  fillColor: Color(0xFF414350),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  border: InputBorder.none),
            ),
          ),
          Flexible(
            child: liste,
          ),
        ],
      ),
    );
  }
}

///头像
class OnlinePersonAction extends StatelessWidget {
  final String personImagePath;
  final Color actColor;
  const OnlinePersonAction({
    Key key,
    this.personImagePath,
    this.actColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            padding: const EdgeInsets.all(3.4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                width: 2.0,
                color: const Color(0xFF558AED),
              ),
            ),
            child: Container(
              width: 54.0,
              height: 54.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                  image: AssetImage(personImagePath),
                  fit: BoxFit.cover
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: actColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Friend {
  String name, image, message, msgTime;

  Friend(this.name, this.image, this.message, this.msgTime);
}

final List<Friend> friends = [
  Friend('John', 'assets/img/1.jpg', 'Hello, how are you?', '1 hr.'),
  Friend('RIna', 'assets/img/4.jpg', 'Hello, how are you?', '1 hr.'),
  Friend('Brad', 'assets/img/5.jpg', 'Hello, how are you?', '1 hr.'),
  Friend('Don', 'assets/img/7.jpg', 'Hello, how are you?', '1 hr.'),
  Friend('Mukambo', 'assets/img/6.jpg', 'Hello, how are you?', '1 hr.'),
  Friend('Sid', 'assets/img/avatar.png', 'Hello, how are you?', '1 hr.'),
];
