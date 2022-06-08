import 'package:flutter/material.dart';
import 'stores_list/groceries_list_store.dart';
import 'button_add_product.dart';

class GroceriesList extends StatefulWidget {
  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  List storesAndItems = [
    {
      "storeName": "Lidl",
      "storeProducts": ["cola", "chips"]
    },
    {
      "storeName": "Colruyt",
      "storeProducts": ["koffie", "pizza"]
    },
  ];

  void addProduct(String product, String storeName) {
    setState(() {
      for (var i in storesAndItems) {
        if (i["storeName"] == storeName) {
          i["storeProducts"].add(product);
        }
      }
    });
  }

  String getFirstStore() {
    return storesAndItems[0]["storeName"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFCFFF3C8),
      child: ListView(
        children: <Widget>[
          AddProductButton(
            title: "title of button",
            addProduct: addProduct,
            storesAndItems: storesAndItems,
            getFirstStore: getFirstStore,
          ),
          for (var i in storesAndItems)
            GroceriesListStore(
                storeName: i["storeName"], storeProducts: i["storeProducts"]),
        ],
      ),
    );
  }
}
