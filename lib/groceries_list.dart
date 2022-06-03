import 'package:flutter/material.dart';

class GroceriesList extends StatefulWidget {
  @override
  State<GroceriesList> createState() => _GroceriesListState();
}
class _GroceriesListState extends State<GroceriesList> {
  String text = "text off";
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
    return Container(
      color: const Color(0xFCFFF3C8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              text,
              style: TextStyle(
                color: itemColor,
                decoration: itemDecoration,
                fontSize: 20,
              ),
            ),
          ]
      ),
    );
  }
}