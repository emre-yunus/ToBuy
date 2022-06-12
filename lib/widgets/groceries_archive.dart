import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import '../archive_list/archive_list_product.dart';
import 'inheritance/translator.dart';

class GroceriesArchive extends StatefulWidget {
  final List storesAndItems;
  final Function addProduct;
  final Function getFirstStore;
  final Function getListOfStores;

  const GroceriesArchive({
    required this.storesAndItems,
    required this.addProduct,
    required this.getFirstStore,
    required this.getListOfStores,
  });

  @override
  State<GroceriesArchive> createState() => _GroceriesArchiveState();
}

class _GroceriesArchiveState extends State<GroceriesArchive> {
  List<List<dynamic>> _data = [];
  List<String> _productsList = [];

  //translations
  List<String> seeMoreProductsTranslation = [
    "More",
    "Meer"
  ];
  List<String> removeProductsTranslation = [
    "Remove All",
    "Verwijder Alles"
  ];

  @override
  void initState() {
    setState(() {
      _loadCSV();
      print(_data);
    });
    super.initState();
  }

  // This function puts the csv data as a list of lists in _data
  void _loadCSV() async {
    final _rawData =
        await rootBundle.loadString("assets/data/Groceries_dataset.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }

  //this fills the next 15 unique items from _data to storesList
  void _fillProductsList() {
    int counter = 0;
    setState(() {
      for (var i in _data.sublist(
        1,
      )) {
        if (!_productsList.contains(i[2])) {
          _productsList.add(i[2].toString());
          counter++;
        }
        if (counter == 15) break;
      }
    });
  }

  void _resetProductList() {
    setState(() {
      _productsList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFCFFF3C8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: ListView(
          children: <Widget>[
            for (var i in _productsList)
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                child: ArchiveListProduct(
                  productName: i,
                  getListOfStores: widget.getListOfStores,
                  getFirstStore: widget.getFirstStore,
                  addProduct: widget.addProduct,
                  storesAndItems: widget.storesAndItems,
                ),
              ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: const Color(0xff6e3945)),
                    child: Text(
                        seeMoreProductsTranslation[
                        TranslatorInheritedWidget.of(context).translationIndex],
                        style: const TextStyle(color: Color(0xFCFFF3C8), fontSize: 20)),
                    onPressed: _fillProductsList,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: const Color(0xff6e3945)),
                    child: Text(
                        removeProductsTranslation[
                        TranslatorInheritedWidget.of(context).translationIndex],
                        style: const TextStyle(color: Color(0xFCFFF3C8), fontSize: 20)),
                    onPressed: _resetProductList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
