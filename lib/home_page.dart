import 'package:flutter/material.dart';

import  'style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Todo"),
      ),
      body: new Center(
        child: new Text("Hello, World !",
          style: new TodoStyle(fontWeight: FontWeight.w400)
        )
      )
    );
  }
}
