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
  List<String> addProductPlusTranslation = ["Add Product +", "Product Toevoegen +"];

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
      onPressed: () => showDialog<String>(
        context: primaryContext,
        builder: (BuildContext context) => AlertDialog(
          title: Text(addProductTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
          content: TextField(
            onChanged: (value) {
              setState(() {
                _valueText = value;
              });
            },
            //controller: _textFieldController,
            decoration: InputDecoration(hintText: nameOfProductTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
          ),
          actions: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Text(pickStoreTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
                ),
                DropDownMenuStores(
                    chosenStore: chosenStore,
                    changeChosenStore: changeChosenStore,
                    storesAndItems: widget.storesAndItems,
                    getFirstStore: widget.getFirstStore,
                    getListOfStores: widget.getListOfStores,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, cancelTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
                  child: Text(cancelTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
                ),
                TextButton(
                  onPressed: () {
                    if (_valueText != "") {
                      widget.addProduct(_valueText, chosenStore);
                    }
                    Navigator.pop(context, addTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]);
                  },
                  child: Text(addTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
                ),
              ],
            ),
          ],
        ),
      ),
      child: Text(addProductPlusTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
    );
  }
}
