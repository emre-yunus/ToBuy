import 'dart:ui';

import 'package:flutter/material.dart';
import '../inheritance/translator.dart';

class DeleteProductButton extends StatefulWidget {
  final String productName;
  final String storeName;
  final Function deleteProduct;

  const DeleteProductButton(
      {required this.deleteProduct,
      required this.storeName,
      required this.productName});

  @override
  State<DeleteProductButton> createState() => _DeleteProductButtonState();
}

class _DeleteProductButtonState extends State<DeleteProductButton> {
  //translations
  List<String> deleteProductTranslation = [
    "Delete product",
    "Verwijder product"
  ];
  List<String> areYouSureTranslation = [
    "Are you sure you want to delete ",
    "Bevestig dat u het volgende wil verwijderen: "
  ];
  List<String> cancelTranslation = ["Cancel", "Annuleer"];
  List<String> confirmTranslation = ["Confirm", "Bevestigen"];
  List<String> removeTranslation = ["remove", "verwijder"];

  TextStyle ts = const TextStyle(
    color: Color(0xff6e3945),
    fontSize: 20,
  );

  @override
  Widget build(BuildContext primaryContext) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 55.0, 0.0),
      height: 30.0,
      width: 60.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: const Color(0xff6e3945)),
        onPressed: () => showDialog<String>(
          context: primaryContext,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: const Color(0xFCFFF3C8),
            title: Text(deleteProductTranslation[
                TranslatorInheritedWidget.of(primaryContext).translationIndex], style: ts,),
            content: Text(areYouSureTranslation[
                    TranslatorInheritedWidget.of(primaryContext)
                        .translationIndex] +
                widget.productName, style: ts,),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(
                        context,
                        cancelTranslation[
                            TranslatorInheritedWidget.of(primaryContext)
                                .translationIndex]),
                    child: Text(cancelTranslation[
                        TranslatorInheritedWidget.of(primaryContext)
                            .translationIndex], style: ts,),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.deleteProduct(widget.productName, widget.storeName);
                      Navigator.pop(
                          context,
                          confirmTranslation[
                              TranslatorInheritedWidget.of(primaryContext)
                                  .translationIndex]);
                    },
                    child: Text(confirmTranslation[
                        TranslatorInheritedWidget.of(primaryContext)
                            .translationIndex], style: ts,),
                  ),
                ],
              ),
            ],
          ),
        ),
          child: const Icon(Icons.delete, color: Color(0xFCFFF3C8),)
      ),
    );
  }
}
