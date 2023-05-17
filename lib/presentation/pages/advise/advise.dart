

import 'package:adviser/presentation/core/services/theme_service.dart';
import 'package:adviser/presentation/pages/advise/widgets/advise_field.dart';
import 'package:adviser/presentation/pages/advise/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Adviser", style: themedata.textTheme.headlineLarge),
        centerTitle: true,
        actions: [
          Switch(value: Provider.of<ThemeService>(context, listen: false).isDarkModeOn, onChanged: (v){
            Provider.of<ThemeService>(context, listen: false).toggleTheme();

          })
        ],
      ),
      body: const   Padding(padding:     EdgeInsets.symmetric(horizontal: 50), 
      child: Column(children: [

        Expanded(child: Center(child: AdviseField(advise: "Example, Your day will be goood"),)),
          CustomButton(),
      ],),)
    );
  }
}