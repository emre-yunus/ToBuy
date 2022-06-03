import 'package:flutter/material.dart';
import 'groceries_archive.dart';
import 'groceries_list.dart';

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_transparent.png',
                fit: BoxFit.contain,
                height: 130,
              ),
              //Container(
              //    padding: const EdgeInsets.all(8.0),
              //    child: Text(
              //      'ToBuy',
              //      style: TextStyle(color: Color(0xffc8b273),
              //    ),
              //),
              //)
            ],
          ),
          bottom: TabBar(
              labelColor: const Color(0xffc8b273),
              indicatorColor: const Color(0xffc8b273),
              tabs: [
                Tab(child: Text(
                  "Groceries",
                  style: TextStyle(
                      fontSize: 20
                  ),
                )
                ),
                Tab(child: Text(
                    "Archive",
                    style: TextStyle(
                        fontSize: 20
                    ),
                )
                )
              ]
          ),
        ),

        body: TabBarView(
            children: <Widget>[
              GroceriesList(),
              GroceriesArchive()
            ]
        ),
      ),
    ),
  );
}

class Scherm3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFCFFF3C8));
  }
}