import 'package:flutter/material.dart';

class GroceriesListProduct extends StatefulWidget {
  final String productName;

  const GroceriesListProduct ({ required this.productName });

  @override
  State<GroceriesListProduct> createState() => _GroceriesListProductState();
}

class _GroceriesListProductState extends State<GroceriesListProduct> {
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
        widget.productName,
        style: TextStyle(
          color: itemColor,
          decoration: itemDecoration,
          fontSize: 20,
        ),
      ),
    ]);
  }
}
