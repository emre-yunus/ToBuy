import 'dart:ui';
import 'package:flutter/material.dart';
import 'mainscreen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
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
          ),
        ),
        body: Container(
          color: const Color(0xFCFFF3C8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 50.0),
                child: const Text(
                  "Language - Taal:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff5b303c),
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 50.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    primary: const Color(0xff834655),
                  ),
                  child: const Text("English",
                      style: TextStyle(color: Color(0xFCFFF3C8), fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen(
                                  translationIndex: 0,
                                )));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    primary: const Color(0xff834655),
                  ),
                  child: const Text("Nederlands",
                      style: TextStyle(color: Color(0xFCFFF3C8), fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen(
                                  translationIndex: 1,
                                )));
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
