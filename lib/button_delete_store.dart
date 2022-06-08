import 'package:flutter/material.dart';

class DeleteStoreButton extends StatefulWidget {
  final String storeName;
  final Function deleteStore;

  const DeleteStoreButton({required this.storeName, required this.deleteStore });

  @override
  State<DeleteStoreButton> createState() => _DeleteStoreButtonState();
}

class _DeleteStoreButtonState extends State<DeleteStoreButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Delete store'),
          content: Text("Are you sure you want to delete ${widget.storeName}"),
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
                    widget.deleteStore(widget.storeName);
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