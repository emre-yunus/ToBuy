import 'package:flutter/material.dart';
import 'groceries_list_item.dart';

class GroceriesList extends StatefulWidget {
  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFCFFF3C8),
      child: ListView(
        children: const <Widget>[
          GroceriesListItem(itemName: "item 1"),
          GroceriesListItem(itemName: "item 2"),
          GroceriesListItem(itemName: "item 3"),
        ],
      ),
    );
  }
}
