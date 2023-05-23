

 
import 'package:adviser/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/advise_enitity.dart';
import '../repositories/advice_repo.dart';

class AdviceUseCases {
    AdviceRepo adviceRepo;
    AdviceUseCases({required this.adviceRepo});

  Future<Either<Failure, AdviceEntity>> getAdvise() async {
     return adviceRepo.getAdviseFromDataSource();
  }
}