import 'package:flutter/material.dart';
import 'package:to_buy/widgets/buttons/button_add_archive_product.dart';

class ArchiveListProduct extends StatefulWidget {
  final String productName;
  final List storesAndItems;
  final Function addProduct;
  final Function getFirstStore;
  final Function getListOfStores;

  const ArchiveListProduct ({
    required this.productName,
    required this.storesAndItems,
    required this.addProduct,
    required this.getFirstStore,
    required this.getListOfStores
  });

  @override
  State<ArchiveListProduct> createState() => _ArchiveListProductState();
}

class _ArchiveListProductState extends State<ArchiveListProduct> {
  TextDecoration itemDecoration = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
        child: Text(
          widget.productName,
          style: TextStyle(
            color: Colors.black,
            decoration: itemDecoration,
            fontSize: 20,
          ),
        ),
      ),
      AddArchiveProductButton(
          productName: widget.productName,
          storesAndItems: widget.storesAndItems,
          addProduct: widget.addProduct,
          getFirstStore: widget.getFirstStore,
          getListOfStores: widget.getListOfStores,
      )
    ]);
  }
}
