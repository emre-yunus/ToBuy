import 'dart:ui';

import 'package:flutter/material.dart';
import '../inheritance/translator.dart';

class DeleteStoreButton extends StatefulWidget {
  final String storeName;
  final Function deleteStore;

  const DeleteStoreButton({required this.storeName, required this.deleteStore});

  @override
  State<DeleteStoreButton> createState() => _DeleteStoreButtonState();
}

class _DeleteStoreButtonState extends State<DeleteStoreButton> {
  //translations
  List<String> deleteStoreTranslation = ["Delete store", "Verwijder winkel"];
  List<String> areYouSureTranslation = [
    "Are you sure you want to delete ",
    "Bevestig dat u het volgende wil verwijderen: "
  ];
  List<String> cancelTranslation = ["Cancel", "Annuleer"];
  List<String> confirmTranslation = ["Confirm", "Bevestigen"];

  @override
  Widget build(BuildContext primaryContext) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
      height: 30.0,
      width: 60.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff6e3945),
        ),
        onPressed: () => showDialog<String>(
          context: primaryContext,
          builder: (BuildContext context) => AlertDialog(
            title: Text(deleteStoreTranslation[
                TranslatorInheritedWidget.of(primaryContext).translationIndex]),
            content: Text(areYouSureTranslation[
                    TranslatorInheritedWidget.of(primaryContext)
                        .translationIndex] +
                widget.storeName),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(
                        context,
                        cancelTranslation[
                            TranslatorInheritedWidget.of(primaryContext)
                                .translationIndex]),
                    child: Text(cancelTranslation[
                        TranslatorInheritedWidget.of(primaryContext)
                            .translationIndex]),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.deleteStore(widget.storeName);
                      Navigator.pop(
                          context,
                          confirmTranslation[
                              TranslatorInheritedWidget.of(primaryContext)
                                  .translationIndex]);
                    },
                    child: Text(
                      confirmTranslation[
                          TranslatorInheritedWidget.of(primaryContext)
                              .translationIndex],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        child: const Icon(Icons.delete, color: Color(0xFCFFF3C8),)
      ),
    );
  }
}
