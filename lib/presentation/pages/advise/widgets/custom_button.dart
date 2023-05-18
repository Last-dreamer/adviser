


import 'package:adviser/presentation/pages/advise/widgets/bloc/adviser_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final themdata = Theme.of(context);
    return InkResponse(
      onTap: (){
        context.read<AdviserBloc>().add(AdviseRequestEvent());
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themdata.colorScheme.secondary
          ),
          child: Padding(padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 15), child: Text("Get Advise", style:themdata.textTheme.headlineLarge),),
        ),
      ),
    );
  }
}