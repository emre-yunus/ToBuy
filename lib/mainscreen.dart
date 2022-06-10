import 'package:flutter/material.dart';
import 'groceries_archive.dart';
import 'groceries_list.dart';
import 'recipe_screen.dart';

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

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showAddProductButton = storesAndItems.isEmpty ? false : true;

  void refreshShowAddProductButton() {
    showAddProductButton = storesAndItems.isEmpty ? false : true;
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

  Widget build(BuildContext buildContext) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff834655),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_transparent.png',
                fit: BoxFit.contain,
                height: 130,
              ),
            ],
          ),
          bottom: TabBar(
              labelColor: const Color(0xffc8b273),
              indicatorColor: const Color(0xffc8b273),
              tabs: [
                Tab(
                    child: Text(
                      "Groceries",
                      style: TextStyle(fontSize: 20),
                    )),
                Tab(
                    child: Text(
                      "Archive",
                      style: TextStyle(fontSize: 20),
                    )),
                Tab(
                    child: Text(
                      "Recipe",
                      style: TextStyle(fontSize: 20),
                    ))
              ]),
        ),
        body: TabBarView(
            children: <Widget>[
              GroceriesList(
                storesAndItems: storesAndItems,
                showAddProductButton: showAddProductButton,
                refreshShowAddProductButton: refreshShowAddProductButton,
                addProduct: addProduct,
                addStore: addStore,
                deleteStore: deleteStore,
                deleteProduct: deleteProduct,
                getFirstStore: getFirstStore,
                getListOfStores: getListOfStores,
              ),
              GroceriesArchive(
                storesAndItems: storesAndItems,
                addProduct: addProduct,
                getFirstStore: getFirstStore,
                getListOfStores: getListOfStores,
              ),
              Recipe()
            ]),
      ),
    ),
  );
}