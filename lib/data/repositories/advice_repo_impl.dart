


import 'package:adviser/domain/entities/advise_enitity.dart';
import 'package:adviser/domain/failures/failure.dart';
import 'package:adviser/domain/repositories/advise_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl extends AdviseRepo {
  @override
  Future<Either<Failure, AdviseEntity>> getAdviseFromDataSource() {
    throw UnimplementedError();
  }
}