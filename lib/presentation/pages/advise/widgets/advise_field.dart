import 'package:flutter/material.dart';

class AdviseField extends StatelessWidget {
  final String advise;
  const AdviseField({super.key,required this.advise});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themeData.colorScheme.onPrimary
        ),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20), 
        child: Text(''' "$advise" ''', 
        textAlign: TextAlign.center,
        style: themeData.textTheme.bodyLarge),),
      ),
    );
  }
}