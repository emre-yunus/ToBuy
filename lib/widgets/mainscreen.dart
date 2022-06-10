import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'groceries_list.dart';
import 'groceries_archive.dart';
import 'recipe_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String groceryList = "[]";
  String storeName = "";

  @override
  void initState() {
    read("nieuwsteLijst").then((waarde) {
      setState(() {
        groceryList = waarde;
      });
    } );
  }

  List getGroceriesListAsJSON() => json.decode(groceryList);

  String getFirstStore() => getGroceriesListAsJSON()[0]["storeName"];

  List<String> getListOfStores() {
    List<String> listOfStores = [];
    for (var i in getGroceriesListAsJSON()) {
      if (!listOfStores.contains(i["storeName"])) listOfStores.add(i["storeName"]);
    }
    return listOfStores;
  }

  void changeStoreName(String newStoreName) {
    storeName = newStoreName;
  }

  //this function adds a store
  void addStore(String storeName) {
    final grocerListsJSON = json.decode(groceryList);

    if (storeName.isNotEmpty && !getListOfStores().contains(storeName)) {
      grocerListsJSON.add({"storeName": storeName, "storeProducts": []});
    }
    groceryList = json.encode(grocerListsJSON);

    setState(() {
      save("nieuwsteLijst", groceryList);
    });
  }

  void deleteStore(String storeName) {
    final grocerListsJSON = json.decode(groceryList);

    grocerListsJSON.removeWhere((i) => i["storeName"] == storeName);
    showAddProductButton(); //this checks if the addproduct button should still be there in case there are no more stores.

    groceryList = json.encode(grocerListsJSON);
    setState(() {
      save("nieuwsteLijst", groceryList);
    });
  }

  //this function adds an unchecked product in a store
  void addProduct(String productName, String storeName) {
    final grocerListsJSON = json.decode(groceryList);

    //this adds the product
    for (var i in grocerListsJSON) {
      if (i["storeName"] == storeName) {
        if (productName.isNotEmpty && !i["storeProducts"].contains(productName)) {
            i["storeProducts"].add({"productName": productName, "checked": false});
        }
      }
    }

    groceryList = json.encode(grocerListsJSON);
    setState(() {
      save("nieuwsteLijst", groceryList);
    });
  }

  //this function removes a product in a specific store
  void deleteProduct(String productName, String storeName) {
    final grocerListsJSON = json.decode(groceryList);

    //this adds the product
    for (var i in grocerListsJSON) {
      if (i["storeName"] == storeName) {
        i["storeProducts"].removeWhere((j) => j["productName"] == productName);
      }
    }

    groceryList = json.encode(grocerListsJSON);
    setState(() {
      save("nieuwsteLijst", groceryList);
    });
  }

  bool getProductIsChecked(String storeName, String productName) {
    for(var i in json.decode(groceryList)) {
      if (i["storeName"] == storeName) {
        for (var j in i["storeProducts"]) {
          if (j["productName"] == productName) return j["checked"];
        }
      }
    }

    return true;
  }

  void productChangeCheckBox(String storeName, String productName) {
    final grocerListsJSON = json.decode(groceryList);

    for (var i in grocerListsJSON) {
      if (i["storeName"] == storeName) {
        for (var j in i["storeProducts"]) {
          if (j["productName"] == productName) {
            j["checked"] = !j["checked"];
          }
        }
      }
    }

    groceryList = json.encode(grocerListsJSON);
    setState(() {
      save("nieuwsteLijst", groceryList);
    });
  }

  bool showAddProductButton() {
    if (getListOfStores().isEmpty) return false;
    return true;
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
                storesAndItems: getGroceriesListAsJSON(),
                showAddProductButton: showAddProductButton(),
                refreshShowAddProductButton: showAddProductButton,
                addProduct: addProduct,
                addStore: addStore,
                deleteStore: deleteStore,
                deleteProduct: deleteProduct,
                getFirstStore: getFirstStore,
                getListOfStores: getListOfStores,
                getProductIsChecked: getProductIsChecked,
                productChangeCheckBox: productChangeCheckBox,
              ),
              GroceriesArchive(
                storesAndItems: getListOfStores(),
                addProduct: addProduct,
                getFirstStore: getFirstStore,
                getListOfStores: getListOfStores,
              ),
              Recipe()
            ]),
      ),
    ),
  );

  Future<void> save(String naam, String waarde) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(naam, waarde);
  }

  Future<String> read(String naam) async {
    final prefs = await SharedPreferences.getInstance();
    //clearSavedPreferences(); //This is used for resetting the groceryList to the initial values that are in the sourcecode.
    final waarde = prefs.getString(naam) ?? groceryList;
    print("$waarde werd gelezen");
    return waarde;
  }

  //This is used for resetting the groceryList to the initial values that are in the sourcecode.
  //used for debugging
  Future<void> clearSavedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
