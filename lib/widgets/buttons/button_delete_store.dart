import 'package:flutter/material.dart';
import '../inheritance/translator.dart';

class DeleteStoreButton extends StatefulWidget {
  final String storeName;
  final Function deleteStore;

  const DeleteStoreButton({required this.storeName, required this.deleteStore });

  @override
  State<DeleteStoreButton> createState() => _DeleteStoreButtonState();
}

class _DeleteStoreButtonState extends State<DeleteStoreButton> {
  //translations
  List<String> deleteStoreTranslation = ["Delete store", "Verwijder winkel"];
  List<String> areYouSureTranslation = ["Are you sure you want to delete ", "Bevestig dat u het volgende wil verwijderen: "];
  List<String> cancelTranslation = ["Cancel", "Annuleer"];
  List<String> confirmTranslation = ["Confirm", "Bevestigen"];
  List<String> removeTranslation = ["remove -", "verwijder -"];

  @override
  Widget build(BuildContext primaryContext) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: primaryContext,
        builder: (BuildContext context) => AlertDialog(
          title: Text(deleteStoreTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
          content: Text(areYouSureTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex] + widget.storeName),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, cancelTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
                  child: Text(cancelTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
                ),
                TextButton(
                  onPressed: () {
                    widget.deleteStore(widget.storeName);
                    Navigator.pop(context, confirmTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]);
                  },
                  child: Text(confirmTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
                ),
              ],
            ),
          ],
        ),
      ),
      child: Text(removeTranslation[TranslatorInheritedWidget.of(primaryContext).translationIndex]),
    );
  }
}