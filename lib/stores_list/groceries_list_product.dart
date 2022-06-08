import 'package:flutter/material.dart';
import 'package:to_buy/button_delete_product.dart';

/**
 * This widget is responsible for rendering the list of products within a specific
 *  store
 * */

class GroceriesListProduct extends StatefulWidget {
  final String productName;
  final String storeName;
  final Function deleteProduct;

  const GroceriesListProduct ({ required this.productName, required this.storeName, required this.deleteProduct });

  @override
  State<GroceriesListProduct> createState() => _GroceriesListProductState();
}

class _GroceriesListProductState extends State<GroceriesListProduct> {
  bool isChecked = false;
  Color itemColor = Colors.black;
  TextDecoration itemDecoration = TextDecoration.none;

  void changeText() {
    if (isChecked) {
      itemColor = Colors.black;
      itemDecoration = TextDecoration.none;
    } else {
      itemColor = Colors.grey;
      itemDecoration = TextDecoration.lineThrough;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Checkbox(
        value: isChecked,
        onChanged: (bool? newValue) {
          setState(() {
            changeText();
            isChecked = newValue!;
          });
        },
        activeColor: Colors.grey,
      ),
      Text(
        widget.productName,
        style: TextStyle(
          color: itemColor,
          decoration: itemDecoration,
          fontSize: 20,
        ),
      ),
      DeleteProductButton(productName: widget.productName, storeName: widget.storeName, deleteProduct: widget.deleteProduct),
    ]);
  }
}
