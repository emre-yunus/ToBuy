import 'package:flutter/material.dart';

class DeleteProductButton extends StatefulWidget {
  final String productName;
  final String storeName;
  final Function deleteProduct;

  const DeleteProductButton({required this.deleteProduct, required this.storeName, required this.productName});

  @override
  State<DeleteProductButton> createState() => _DeleteProductButtonState();
}

class _DeleteProductButtonState extends State<DeleteProductButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Delete product'),
          content: Text("Are you sure you want to delete ${widget.productName}"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    widget.deleteProduct(widget.productName, widget.storeName);
                    Navigator.pop(context, 'Confirm');
                  },
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
      child: const Text('remove -'),
    );
  }
}