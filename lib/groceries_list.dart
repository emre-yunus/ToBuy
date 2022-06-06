import 'package:flutter/material.dart';
import 'stores_list/groceries_list_store.dart';

class GroceriesList extends StatefulWidget {
  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  List<String> storesList = ["Lidl", "Colruyt", "Carrefour"];
  List<String> items = ["item 1", "item 2", "item 3", "item 4"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFCFFF3C8),
      child: ListView(
        children: <Widget>[
          for (var i in storesList) GroceriesListStore(storeName: i),
        ],
      ),
    );
  }
}
