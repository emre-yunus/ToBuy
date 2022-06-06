import 'package:flutter/material.dart';

class GroceriesListItem extends StatefulWidget {
  final String itemName;

  const GroceriesListItem ({ required this.itemName });

  @override
  State<GroceriesListItem> createState() => _GroceriesListItemState();
}

class _GroceriesListItemState extends State<GroceriesListItem> {
  bool isChecked = false;
  Color itemColor = Colors.black;
  TextDecoration itemDecoration = TextDecoration.none;

  void changeText() {
    if (isChecked) {
      itemColor = Colors.black;
      itemDecoration = TextDecoration.none;
    } else {
      itemColor = Colors.grey;
      itemDecoration = TextDecoration.lineThrough;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Checkbox(
        value: isChecked,
        onChanged: (bool? newValue) {
          setState(() {
            changeText();
            isChecked = newValue!;
          });
        },
        activeColor: Colors.grey,
      ),
      Text(
        widget.itemName,
        style: TextStyle(
          color: itemColor,
          decoration: itemDecoration,
          fontSize: 20,
        ),
      ),
    ]);
  }
}
