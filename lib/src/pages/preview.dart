import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/src/widgets/code_view.dart';
import 'package:flutter_ui_challenges/src/widgets/keep_alive.dart';

const _TABS = <Widget>[
  Tab(
    // text: 'Preview',
    // icon: Icon(Icons.phone_android),
    child: ListTile(
      leading: Icon(
        Icons.phone_android,
        color: Colors.white,
      ),
      title: Text(
        'Preview',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
  Tab(
    // text: 'Code',
    // icon: Icon(Icons.code),
    child: ListTile(
      leading: Icon(
        Icons.code,
        color: Colors.white,
      ),
      title: Text(
        'Code',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
];
class DesignPreviewsPage extends StatelessWidget {
  final String title;
  final Widget page;
  final String code;

  const DesignPreviewsPage({Key key, @required this.title, @required this.page, @required this.code}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: _TABS.length,
      child: Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: TabBar(
          tabs: _TABS,
        ),
      ),
      body: TabBarView(
          children: <Widget>[
            AlwaysAliveWidget(child: page,),
            AlwaysAliveWidget(child: MyCodeView(filePath: "lib/src/pages/animations/anim2.dart",))
          ],
        ),
      ),
    );
  }
}