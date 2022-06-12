import 'dart:ui';

import 'package:flutter/material.dart';
import 'dropdownmenu_stores.dart';
import '../inheritance/translator.dart';

class AddArchiveProductButton extends StatefulWidget {
  final String productName;
  final List storesAndItems;
  final Function addProduct;
  final Function getFirstStore;
  final Function getListOfStores;

  const AddArchiveProductButton(
      {required this.productName,
      required this.storesAndItems,
      required this.addProduct,
      required this.getFirstStore,
      required this.getListOfStores});

  @override
  State<AddArchiveProductButton> createState() =>
      _AddArchiveProductButtonState();
}

class _AddArchiveProductButtonState extends State<AddArchiveProductButton> {
  String chosenStore = "";

  //translations
  List<String> addProductTranslation = ["Add Product", "Product Toevoegen"];
  List<String> pickStoreTranslation = ["Pick a store:", "Kies een winkel:"];
  List<String> cancelTranslation = ["Cancel", "Annuleer"];
  List<String> addTranslation = ["Add", "Toevoegen"];

  TextStyle ts = const TextStyle(
    color: Color(0xff6e3945),
    fontSize: 20,
  );

  @override
  void initState() {
    if (widget.storesAndItems.isNotEmpty) chosenStore = widget.getFirstStore();
  }

  void changeChosenStore(String newStore) {
    setState(() {
      chosenStore = newStore;
    });
  }

  @override
  Widget build(BuildContext primaryContext) {
    return SizedBox(
      height: 25.0,
      width: 60.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: const Color(0xff6e3945)),
        onPressed: () => showDialog<String>(
          context: primaryContext,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: const Color(0xFCFFF3C8),
            title: Text(
              addProductTranslation[TranslatorInheritedWidget.of(primaryContext)
                  .translationIndex],
              style: ts,
            ),
            content: null,
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
                        if (chosenStore != "") {
                          widget.addProduct(chosenStore, chosenStore);
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
        child: const Icon(Icons.add, color: Color(0xFCFFF3C8)),
      ),
    );
  }
}
