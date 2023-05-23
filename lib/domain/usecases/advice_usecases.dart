

import 'package:adviser/data/repositories/advice_repo_impl.dart';
import 'package:adviser/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/advise_enitity.dart';

class AdviseUseCases {
  final adviceRepo = AdviceRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvise() async {
     return adviceRepo.getAdviseFromDataSource();
  }
}