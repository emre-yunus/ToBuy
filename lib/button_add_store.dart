import 'package:flutter/material.dart';

class AddStoreButton extends StatefulWidget {
  final Function addStore;
  final Function getListOfStores;

  const AddStoreButton({required this.addStore, required this.getListOfStores});

  @override
  State<AddStoreButton> createState() => _AddStoreButtonState();
}

class _AddStoreButtonState extends State<AddStoreButton> {
  String _valueText = "";

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Add Store'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                _valueText = value;
              });
            },
            //controller: _textFieldController,
            decoration: InputDecoration(hintText: "Name of store"),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_valueText != "" && !widget.getListOfStores().contains(_valueText) ) {
                      widget.addStore(_valueText);
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
      child: const Text('Add store +'),
    );
  }
}
