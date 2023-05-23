


import 'package:adviser/data/datasources/advice_remote_datasource.dart';
import 'package:adviser/domain/entities/advise_enitity.dart';
import 'package:adviser/domain/failures/failure.dart';
import 'package:adviser/domain/repositories/advise_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl extends AdviseRepo {

  final AdviceRemoteDataSourceImpl source =  AdviceRemoteDataSourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviseFromDataSource() async{
      var result = await source.getRandomAdviceFromApi();
      return right(result);
  }
}