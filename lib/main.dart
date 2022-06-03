import 'package:flutter/material.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  Widget build(BuildContext buildContext) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff834655),
          title: Text(
            "ToBuy",
            style: TextStyle(color: Color(0xffc8b273)),
          ),
          bottom: TabBar(
              labelColor: const Color(0xffc8b273),
              indicatorColor: const Color(0xffc8b273),
              tabs: [
                Tab(text: 'Groceries'),
                Tab(text: 'Archive')
              ]
          ),
        ),

        body: TabBarView(
            children: <Widget>[
              AppTree(),
              Scherm2()
            ]
        ),
      ),
    ),
  );
}

class AppTree extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFCFFF3C8),);
  }
}

class Scherm2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFCFFF3C8));
  }
}

class Scherm3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFCFFF3C8));
  }
}