import 'package:flutter/material.dart';
import 'package:to_buy/widgets/buttons/button_delete_product.dart';
import 'package:audioplayers/audioplayers.dart';

/**
 * This widget is responsible for rendering the list of products within a specific
 *  store
 * */

class GroceriesListProduct extends StatefulWidget {
  final String productName;
  final Function getProductIsChecked;
  final String storeName;
  final Function deleteProduct;
  final Function productChangeCheckBox;

  const GroceriesListProduct({
    required this.productName,
    required this.getProductIsChecked,
    required this.storeName,
    required this.deleteProduct,
    required this.productChangeCheckBox,
  });

  @override
  State<GroceriesListProduct> createState() => _GroceriesListProductState();
}

class _GroceriesListProductState extends State<GroceriesListProduct> {
  final AudioCache audioPlayer = AudioCache();
  late Color itemColor;
  late TextDecoration itemDecoration;

  @override
  void initState() {
    changeText();
    super.initState();
  }

  void changeText() {
    if (!widget.getProductIsChecked(widget.storeName, widget.productName)) {
      itemColor = Colors.black;
      itemDecoration = TextDecoration.none;
    } else {
      itemColor = Colors.grey;
      itemDecoration = TextDecoration.lineThrough;
    }
  }

  void toggleCheckBox() {
    audioPlayer.play('audio/notification_sound.mp3');
    widget.productChangeCheckBox(widget.storeName,
        widget.productName); //this changes the checked status of the product
    setState(() {
      changeText();
    });
  }

  @override
  Widget build(BuildContext context) {
    audioPlayer.load('audio/notification_sound.mp3');

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: widget.getProductIsChecked(widget.storeName, widget.productName),
            onChanged: (bool? newValue) {
              toggleCheckBox();
            },
            activeColor: Colors.grey,
          ),
          Text(
            widget.productName,
            style: TextStyle(
              color: itemColor,
              decoration: itemDecoration,
              fontSize: 25,
            ),
          ),
        ],
      ),
      DeleteProductButton(
          productName: widget.productName,
          storeName: widget.storeName,
          deleteProduct: widget.deleteProduct),
    ]);
  }
}
