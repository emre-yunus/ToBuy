import 'package:flutter/material.dart';

class DropDownMenuStores extends StatefulWidget {
  final String chosenStore;
  final Function changeChosenStore;
  final List storesAndItems;
  final Function getFirstStore;
  final Function getListOfStores;

  const DropDownMenuStores(
      {required this.chosenStore,
      required this.changeChosenStore,
      required this.storesAndItems,
      required this.getFirstStore,
      required this.getListOfStores});

  @override
  State<DropDownMenuStores> createState() => _DropDownMenuStoresState();
}

class _DropDownMenuStoresState extends State<DropDownMenuStores> {
  late String currentValue;

  @override
  void initState() {
    // it cannot get the first store if the storesAndItems list is empty
    if (widget.storesAndItems.isNotEmpty) currentValue = widget.getFirstStore();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: const Color(0xFCFFF3C8),
      value: currentValue,
      icon: const Icon(Icons.arrow_downward, color: Color(0xff6e3945),),
      elevation: 16,
      style: const TextStyle(color: Color(0xff6e3945), fontSize: 20),
      underline: Container(
        height: 2,
        color: const Color(0xff6e3945),
      ),
      onChanged: (String? value) {
        setState(() {
          widget.changeChosenStore(value);
          currentValue = value!; //without this the dropdown does not show the current choice of store
        });
      },
      items: widget.getListOfStores().map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
