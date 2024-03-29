import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/buttons/button_delete_store.dart';
import 'groceries_list_product.dart';

/**
 * This widget is in charge of rendering the list of a store and the products for
 * that store.
 * */

class GroceriesListStore extends StatefulWidget {
  final String storeName;
  final List storeProducts;
  final Function deleteProduct;
  final Function deleteStore;
  final Function getProductIsChecked;
  final Function productChangeCheckBox;

  const GroceriesListStore({
    required this.storeName,
    required this.storeProducts,
    required this.deleteProduct,
    required this.deleteStore,
    required this.getProductIsChecked,
    required this.productChangeCheckBox,
  });

  @override
  State<GroceriesListStore> createState() => _GroceriesListStoreState();
}

class _GroceriesListStoreState extends State<GroceriesListStore> {
  bool _showData = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          // list card containing country name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    setState(() => _showData = !_showData);
                  },
                  child: Row(
                    children: [
                      Icon(
                        _showData ? Icons.arrow_drop_down : Icons.arrow_right,
                        size: 50,
                        color: const Color(0xff6e3945),
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.storeName,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              DeleteStoreButton(
                storeName: widget.storeName,
                deleteStore: widget.deleteStore,
              ),
            ],
          ),

          // this is the company card which is toggling based upon the bool
          _showData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var i in widget.storeProducts)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                        child: GroceriesListProduct(
                          productName: i["productName"],
                          storeName: widget.storeName,
                          deleteProduct: widget.deleteProduct,
                          getProductIsChecked: widget.getProductIsChecked,
                          productChangeCheckBox: widget.productChangeCheckBox,
                        ),
                      )
                  ],
                )
              : const SizedBox() // else blank
        ]);
  }
}
