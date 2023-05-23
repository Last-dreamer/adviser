

  
import 'package:adviser/presentation/pages/advice/widgets/bloc/advicer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final themdata = Theme.of(context);
    return InkResponse(
      onTap: (){
        context.read<AdvicerBloc>().add(AdviceRequestEvent());
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