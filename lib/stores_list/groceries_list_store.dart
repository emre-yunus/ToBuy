import 'package:flutter/material.dart';
import 'groceries_list_product.dart';

class GroceriesListStore extends StatefulWidget {
  final String storeName;

  const GroceriesListStore({required this.storeName});

  @override
  State<GroceriesListStore> createState() => _GroceriesListStoreState();
}

class _GroceriesListStoreState extends State<GroceriesListStore> {
  bool _showData = false;
  List<String> products = ["water", "bread"];

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          // list card containing country name
          GestureDetector(
              onTap: () {
                setState(() => _showData = !_showData);
              },
              child: Container(
                  //width: MediaQuery.of(context).size.width,
                  //decoration: BoxDecoration(
                  //    color: const Color(0xFCFFF3C8),
                  //    boxShadow: [
                  //      BoxShadow(color: Colors.grey, offset: Offset(0.0, 3.0))
                  //    ]),
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // add your other icon here
                            Text(
                              widget.storeName,
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            )
                          ])))),

          // this is the company card which is toggling based upon the bool
          _showData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var i in products)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: GroceriesListProduct(productName: i),
                      )
                  ],
                )
              : SizedBox() // else blank
        ]);
  }
}
