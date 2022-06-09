import 'package:flutter/material.dart';
import 'groceries_archive.dart';
import 'groceries_list.dart';
import 'recipe_screen.dart';
import 'videotest.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  Widget build(BuildContext buildContext) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff834655),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_transparent.png',
                    fit: BoxFit.contain,
                    height: 130,
                  ),
                ],
              ),
              bottom: TabBar(
                  labelColor: const Color(0xffc8b273),
                  indicatorColor: const Color(0xffc8b273),
                  tabs: [
                    Tab(
                        child: Text(
                      "Groceries",
                      style: TextStyle(fontSize: 20),
                    )),
                    Tab(
                        child: Text(
                      "Archive",
                      style: TextStyle(fontSize: 20),
                    )),
                    Tab(
                        child: Text(
                      "Recipe",
                      style: TextStyle(fontSize: 20),
                    ))
                  ]),
            ),
            body: TabBarView(
                children: <Widget>[GroceriesList(), GroceriesArchive(), AppTree()]),
          ),
        ),
      );
}
