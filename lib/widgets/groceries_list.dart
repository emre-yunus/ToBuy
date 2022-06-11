import 'dart:ui';

import 'package:flutter/material.dart';
import 'buttons/button_add_store.dart';
import 'buttons/button_add_product.dart';
import '../stores_list/groceries_list_store.dart';

class GroceriesList extends StatefulWidget {
  final List storesAndItems;
  final bool showAddProductButton;
  final Function refreshShowAddProductButton;
  final Function addProduct;
  final Function addStore;
  final Function deleteStore;
  final Function deleteProduct;
  final Function getFirstStore;
  final Function getListOfStores;
  final Function getProductIsChecked;
  final Function productChangeCheckBox;

  const GroceriesList({
    required this.storesAndItems,
    required this.showAddProductButton,
    required this.refreshShowAddProductButton,
    required this.addProduct,
    required this.addStore,
    required this.deleteStore,
    required this.deleteProduct,
    required this.getFirstStore,
    required this.getListOfStores,
    required this.getProductIsChecked,
    required this.productChangeCheckBox,
  });

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFCFFF3C8),
      child: ListView(
        children: <Widget>[
          AddStoreButton(
              addStore: widget.addStore,
              getListOfStores: widget.getListOfStores),
          widget.showAddProductButton
              ? AddProductButton(
                  title: "title of button",
                  addProduct: widget.addProduct,
                  storesAndItems: widget.storesAndItems,
                  getFirstStore: widget.getFirstStore,
                  getListOfStores: widget.getListOfStores,
                )
              : SizedBox(),
          for (var i in widget.storesAndItems)
            GroceriesListStore(
              storeName: i["storeName"],
              storeProducts: i["storeProducts"] ?? [],
              deleteProduct: widget.deleteProduct,
              deleteStore: widget.deleteStore,
              getProductIsChecked: widget.getProductIsChecked,
              productChangeCheckBox: widget.productChangeCheckBox,
            ),
        ],
      ),
    );
  }
}
