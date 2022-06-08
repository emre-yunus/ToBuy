import 'package:flutter/material.dart';
import 'store_and_products.dart';

class DropDownMenuStores extends StatefulWidget {
  final String chosenStore;
  final Function changeChosenStore;
  final List storesAndItems;
  final Function getFirstStore;

  const DropDownMenuStores(
      {required this.chosenStore,
      required this.changeChosenStore,
      required this.storesAndItems,
      required this.getFirstStore});

  @override
  State<DropDownMenuStores> createState() => _DropDownMenuStoresState();
}

class _DropDownMenuStoresState extends State<DropDownMenuStores> {
  late String currentValue;

  @override
  void initState() {
    currentValue = widget.getFirstStore();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      //value: widget.chosenStore,
      value: currentValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          widget.changeChosenStore(value);
          currentValue = value!; //without this the dropdown does not show the current choice of store
        });
      },
      items: getStoresList().map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
