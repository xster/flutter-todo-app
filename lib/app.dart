import 'package:flutter/material.dart';

import 'fullscreen_dialog.dart';
import 'home_page.dart';
class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber[500],
          primaryColor: Colors.red[500],
      ),
      home: new HomePage(),
        routes: <String, WidgetBuilder>{
          "/new": (BuildContext ctx) => new FullScreenDialog(),
        }
    );
  }
}
