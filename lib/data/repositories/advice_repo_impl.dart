


import 'package:adviser/data/datasources/advice_remote_datasource.dart';
import 'package:adviser/data/exceptions/exceptions.dart';
import 'package:adviser/domain/entities/advise_enitity.dart';
import 'package:adviser/domain/failures/failure.dart';
import 'package:adviser/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl extends AdviceRepo {
    AdviceRepoImpl({required this.source});
  final AdviceRemoteDataSourceImpl source;

  @override
  Future<Either<Failure, AdviceEntity>> getAdviseFromDataSource() async{
     
     try {
        var result = await source.getRandomAdviceFromApi();
      return right(result);
      
     } on ServerException catch(_) {
      return left(ServerFailure());
     } catch (e) {
       return left(GeneralFailure());
     }
  }
}