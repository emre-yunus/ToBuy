import 'dart:ui';

import 'package:flutter/material.dart';
import '../inheritance/translator.dart';

class AddStoreButton extends StatefulWidget {
  final Function addStore;
  final Function getListOfStores;

  const AddStoreButton({required this.addStore, required this.getListOfStores});

  @override
  State<AddStoreButton> createState() => _AddStoreButtonState();
}

class _AddStoreButtonState extends State<AddStoreButton> {
  String _valueText = "";

  //translations
  List<String> addStoreTranslation = ["Add Store", "Winkel Toevoegen"];
  List<String> nameOfStoreTranslation = ["Name Of Store", "Winkelnaam"];
  List<String> cancelTranslation = ["Cancel", "Annuleer"];
  List<String> addTranslation = ["Add", "Toevoegen"];
  List<String> addStorePlusTranslation = ["Store +", "Winkel +"];

  TextStyle ts = const TextStyle(
    color: Color(0xff6e3945),
    fontSize: 20,
  );

  @override
  Widget build(BuildContext primaryContext) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff6e3945),
      ),
      onPressed: () => showDialog<String>(
        context: primaryContext,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: const Color(0xFCFFF3C8),
          title: Text(
            addStoreTranslation[
                TranslatorInheritedWidget.of(primaryContext).translationIndex],
            style: const TextStyle(
              color: Color(0xff6e3945),
            ),
          ),
          content: TextField(
            onChanged: (value) {
              setState(() {
                _valueText = value;
              });
            },
            //controller: _textFieldController,
            decoration: InputDecoration(
                hintText: nameOfStoreTranslation[
                    TranslatorInheritedWidget.of(primaryContext)
                        .translationIndex]),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(
                      context,
                      cancelTranslation[
                          TranslatorInheritedWidget.of(primaryContext)
                              .translationIndex]),
                  child: Text(
                    cancelTranslation[
                        TranslatorInheritedWidget.of(primaryContext)
                            .translationIndex],
                    style: ts,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.addStore(_valueText);
                    Navigator.pop(
                        context,
                        addTranslation[
                            TranslatorInheritedWidget.of(primaryContext)
                                .translationIndex]);
                  },
                  child: Text(
                    addTranslation[TranslatorInheritedWidget.of(primaryContext)
                        .translationIndex],
                    style: ts,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      child: Text(
        addStorePlusTranslation[
            TranslatorInheritedWidget.of(primaryContext).translationIndex],
        style: const TextStyle(color: Color(0xFCFFF3C8), fontSize: 20),
      ),
    );
  }
}
