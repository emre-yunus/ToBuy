import 'package:flutter/material.dart';



class TranslatorInheritedWidget extends InheritedWidget {
  final int translationIndex;

  TranslatorInheritedWidget(this.translationIndex, Widget child) : super(child: child);

  static TranslatorInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TranslatorInheritedWidget>() as TranslatorInheritedWidget;

  @override
  bool updateShouldNotify(TranslatorInheritedWidget oldWidget) =>
    oldWidget.translationIndex != oldWidget.translationIndex;
}