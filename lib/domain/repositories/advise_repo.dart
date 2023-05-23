


import 'package:adviser/domain/entities/advise_enitity.dart';
import 'package:dartz/dartz.dart';

import '../failures/failure.dart';

abstract class AdviseRepo {
  Future<Either<Failure, AdviceEntity>> getAdviseFromDataSource();
}