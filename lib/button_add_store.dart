import 'package:flutter/material.dart';
import 'dropdownmenu_stores.dart';

class AddStoreButton extends StatefulWidget {
  final Function addStore;

  const AddStoreButton({required this.addStore});

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
                    if (_valueText != "") {
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
