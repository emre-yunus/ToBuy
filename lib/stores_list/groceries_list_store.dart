import 'package:flutter/material.dart';
import '../button_delete_store.dart';
import 'groceries_list_product.dart';

/**
 * This widget is in charge of rendering the list of a store and the products for
 * that store.
 * */

class GroceriesListStore extends StatefulWidget {
  final String storeName;
  final List<String> storeProducts;
  final Function deleteProduct;
  final Function deleteStore;

  const GroceriesListStore(
      {required this.storeName,
      required this.storeProducts,
      required this.deleteProduct,
      required this.deleteStore});

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
          SizedBox(height: 10.0),
          // list card containing country name
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() => _showData = !_showData);
                  },
                  child: Container(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.storeName,
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                )
                              ])))),
              DeleteStoreButton(storeName: widget.storeName, deleteStore: widget.deleteStore,)
            ],
          ),

          // this is the company card which is toggling based upon the bool
          _showData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var i in widget.storeProducts)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: GroceriesListProduct(
                          productName: i,
                          storeName: widget.storeName,
                          deleteProduct: widget.deleteProduct,
                        ),
                      )
                  ],
                )
              : SizedBox() // else blank
        ]);
  }
}
