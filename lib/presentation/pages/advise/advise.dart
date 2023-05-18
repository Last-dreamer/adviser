import 'package:adviser/presentation/core/services/theme_service.dart';
import 'package:adviser/presentation/pages/advise/widgets/advise_field.dart';
import 'package:adviser/presentation/pages/advise/widgets/bloc/adviser_bloc.dart';
import 'package:adviser/presentation/pages/advise/widgets/custom_button.dart';
import 'package:adviser/presentation/pages/advise/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


class AdviserPageWrapperProvider extends StatelessWidget {
  const AdviserPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AdviserBloc(), child: const AdviserPage());
  }
}


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
              Expanded(child: BlocBuilder<AdviserBloc, AdviserState>(
                builder: (context, state) {
                  if(state is AdviserInitial){
                    return Center(child: Text("Your advise is on your way.", style: themedata.textTheme.bodyLarge));
                  }else if(state is AdviserLoading){
                    return Center(child: CircularProgressIndicator(color: themedata.colorScheme.secondary),);
                  }else if(state is AdviserLoaded){
                   return   Center(
                    child:
                        AdviseField(advise: state.adivce),
                  );
                  }else if(state is AdviserError){
                    return ErrorMessage(message: state.message);
                  }
                  return Container();
                },
              )),
              const CustomButton(),
            ],
          ),
        ));
  }
}
