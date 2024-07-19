import 'package:adviser/di.dart';
import 'package:adviser/presentation/core/services/theme_service.dart';
import 'package:adviser/presentation/pages/advice/widgets/advice_field.dart';
import 'package:adviser/presentation/pages/advice/widgets/bloc/advicer_bloc.dart';
import 'package:adviser/presentation/pages/advice/widgets/custom_button.dart';
import 'package:adviser/presentation/pages/advice/widgets/error_message.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => di<AdvicerBloc>(), 
    child: const AdvicerPage());
  }
}


class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Adviser", style: themedata.textTheme.headlineLarge),
          centerTitle: true,
          actions: [
            Switch(
                value: Provider.of<ThemeService>(context, listen: false)
                    .isDarkModeOn,
                onChanged: (v) {
                  Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(child: BlocBuilder<AdvicerBloc, AdvicerState>(
                builder: (context, state) {
                  if(state is AdvicerInitial){
                    return Center(child: Text("Your advise is on your way.", style: themedata.textTheme.bodyLarge));
                  }else if(state is AdvicerLoading){
                    return Center(child: CircularProgressIndicator(color: themedata.colorScheme.secondary),);
                  }else if(state is AdvicerLoaded){
                   return Center(
                    child:
                        AdviceField(advice: state.advice),
                   );
                  }else if(state is AdvicerError){
                    return Center(child: ErrorMessage(message: state.message));
                  }
                  return Container();
                },
              )),
              const CustomButton(),
              const SizedBox(height: 10,),
            ],
          ),
        ));
  }
}
