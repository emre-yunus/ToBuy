import 'dart:ui';

import 'package:flutter/material.dart';
import 'dropdownmenu_stores.dart';
import '../inheritance/translator.dart';

class AddProductButton extends StatefulWidget {
  final String title;
  final List storesAndItems;
  final Function addProduct;
  final Function getFirstStore;
  final Function getListOfStores;

  const AddProductButton(
      {required this.title,
      required this.storesAndItems,
      required this.addProduct,
      required this.getFirstStore,
      required this.getListOfStores});

  @override
  State<AddProductButton> createState() => _AddProductButtonState();
}

class _AddProductButtonState extends State<AddProductButton> {
  String _valueText = "";
  String chosenStore = "";

  //translations
  List<String> addProductTranslation = ["Add Product", "Product Toevoegen"];
  List<String> nameOfProductTranslation = ["Name of product", "Productnaam"];
  List<String> pickStoreTranslation = ["Pick a store:", "Kies een winkel:"];
  List<String> cancelTranslation = ["Cancel", "Annuleer"];
  List<String> addTranslation = ["Add", "Toevoegen"];

  TextStyle ts = const TextStyle(
    color: Color(0xff6e3945),
    fontSize: 20,
  );

  @override
  void initState() {
    // it cannot get the first store if the storesAndItems list is empty
    if (widget.storesAndItems.isNotEmpty) chosenStore = widget.getFirstStore();
  }

  void changeChosenStore(String newStore) {
    setState(() {
      chosenStore = newStore;
    });
  }

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
            addProductTranslation[
                TranslatorInheritedWidget.of(primaryContext).translationIndex],
            style: const TextStyle(
              color: Color(0xff6e3945),
              fontSize: 25,
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
                hintText: nameOfProductTranslation[
                    TranslatorInheritedWidget.of(primaryContext)
                        .translationIndex]),
          ),
          actions: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pickStoreTranslation[
                          TranslatorInheritedWidget.of(primaryContext)
                              .translationIndex],
                      style: ts,
                    ),
                    DropDownMenuStores(
                      chosenStore: chosenStore,
                      changeChosenStore: changeChosenStore,
                      storesAndItems: widget.storesAndItems,
                      getFirstStore: widget.getFirstStore,
                      getListOfStores: widget.getListOfStores,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
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
                      if (_valueText != "") {
                        widget.addProduct(_valueText, chosenStore);
                      }
                      Navigator.pop(
                          context,
                          addTranslation[
                              TranslatorInheritedWidget.of(primaryContext)
                                  .translationIndex]);
                    },
                    child: Text(
                      addTranslation[
                          TranslatorInheritedWidget.of(primaryContext)
                              .translationIndex],
                      style: ts,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      child: const Text(
        "Product +",
        style: TextStyle(color: Color(0xFCFFF3C8), fontSize: 20),
      ),
    );
  }
}
