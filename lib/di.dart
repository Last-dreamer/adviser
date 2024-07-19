

import 'package:adviser/data/datasources/advice_remote_datasource.dart';
import 'package:adviser/data/repositories/advice_repo_impl.dart';
import 'package:adviser/domain/repositories/advice_repo.dart';
import 'package:adviser/domain/usecases/advice_usecases.dart';
import 'package:adviser/presentation/pages/advice/widgets/bloc/advicer_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final di = GetIt.I;


Future<void> init() async {

  di.registerFactory(() => AdvicerBloc(adviceUseCases: di()));
  di.registerFactory(() => AdviceUseCases(adviceRepo: di()));
  di.registerFactory<AdviceRepo>(() => AdviceRepoImpl(source: di()));
  di.registerFactory<AdviceRemoteDataSource>(() => AdviceRemoteDataSourceImpl(client: di()));
  di.registerFactory(() => http.Client());
}