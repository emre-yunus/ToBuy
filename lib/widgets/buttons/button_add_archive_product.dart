import 'package:flutter/material.dart';
import 'dropdownmenu_stores.dart';

class AddArchiveProductButton extends StatefulWidget {
  final String productName;
  final List storesAndItems;
  final Function addProduct;
  final Function getFirstStore;
  final Function getListOfStores;

  const AddArchiveProductButton(
      {
        required this.productName,
        required this.storesAndItems,
        required this.addProduct,
        required this.getFirstStore,
        required this.getListOfStores});

  @override
  State<AddArchiveProductButton> createState() => _AddArchiveProductButtonState();
}

class _AddArchiveProductButtonState extends State<AddArchiveProductButton> {
  String chosenStore = "";

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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Add Product'),
          content: null,
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
                    widget.addProduct(widget.productName, chosenStore);
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
