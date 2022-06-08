import 'package:flutter/material.dart';
import 'dropdownmenu_stores.dart';

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

  @override
  void initState() {
    chosenStore = widget.getFirstStore();
  }

  void changeChosenStore(String newStore) {
    setState(() {
      chosenStore = newStore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Add Product'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                _valueText = value;
              });
            },
            //controller: _textFieldController,
            decoration: InputDecoration(hintText: "Name of product"),
          ),
          actions: <Widget>[
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Text("Pick a store:"),
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
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_valueText != "") {
                      widget.addProduct(_valueText, chosenStore);
                    }
                    Navigator.pop(context, 'Add');
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
      child: const Text('Add Product +'),
    );
  }
}
