import 'package:flutter/material.dart';
import 'button_add_store.dart';
import 'stores_list/groceries_list_store.dart';
import 'button_add_product.dart';

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

class GroceriesList extends StatefulWidget {
  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  bool _showAddProductButton = storesAndItems.isEmpty ? false : true;

  //@override
  //void initState() {
  //  _showAddProductButton = storesAndItems.isEmpty ? false : true;
  //}

  void refreshShowAddProductButton() {
    _showAddProductButton = storesAndItems.isEmpty ? false : true;
  }

  void addProduct(String product, String storeName) {
    setState(() {
      for (var i in storesAndItems) {
        if (i["storeName"] == storeName) {
          i["storeProducts"].add(product);
        }
      }
    });
  }

  void addStore(String storeName) {
    setState(() {
      storesAndItems.add({"storeName": storeName, "storeProducts": <String>[]});
      refreshShowAddProductButton();
    });
  }

  void deleteStore(String storeName) {
    setState(() {
      storesAndItems.removeWhere((i) => i["storeName"] == storeName);
      refreshShowAddProductButton();
    });
  }

  void deleteProduct(String productName, String storeName) {
    setState(() {
      for (var i in storesAndItems) {
        if (i["storeName"] == storeName) {
          i["storeProducts"].remove(productName);
        }
      }
    });
  }

  String getFirstStore() {
    return storesAndItems[0]["storeName"];
  }

  List<String> getListOfStores() {
    List<String> storeList = [];

    for (var i in storesAndItems) {
      storeList.add(i["storeName"]);
    }

    return storeList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFCFFF3C8),
      child: ListView(
        children: <Widget>[
          AddStoreButton(addStore: addStore, getListOfStores: getListOfStores),
          _showAddProductButton
              ? AddProductButton(
                  title: "title of button",
                  addProduct: addProduct,
                  storesAndItems: storesAndItems,
                  getFirstStore: getFirstStore,
                  getListOfStores: getListOfStores,
                )
              : SizedBox(),
          for (var i in storesAndItems)
            GroceriesListStore(
              storeName: i["storeName"],
              storeProducts: i["storeProducts"],
              deleteProduct: deleteProduct,
              deleteStore: deleteStore,
            ),
        ],
      ),
    );
  }
}
