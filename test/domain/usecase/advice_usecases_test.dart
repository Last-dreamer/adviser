

import 'package:adviser/data/repositories/advice_repo_impl.dart';
import 'package:adviser/domain/entities/advise_enitity.dart';
import 'package:adviser/domain/failures/failure.dart';
import 'package:adviser/domain/usecases/advice_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_usecases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepoImpl>()])
void main(){

  group("adviceUsecase", () {


    group("should return advice entity", () { 

      test("should return advice entity", () async {
         final mockAdviceRepoImpl = MockAdviceRepoImpl();
      final mockAdviceUsecasesTest = AdviceUseCases(adviceRepo: mockAdviceRepoImpl);

      when(mockAdviceRepoImpl.getAdviseFromDataSource()).thenAnswer((realInvocation) => Future.value(const Right(AdviceEntity(advice: "test", id: 1))));

        final result  = await mockAdviceUsecasesTest.getAdvise();

        expect(result.isRight(), true);
        expect(result.isLeft(), false);

        expect(result, const Right<Failure, AdviceEntity>(AdviceEntity(id: 1, advice: "test")));
        verify(mockAdviceRepoImpl.getAdviseFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);

      });

    });


    group("should return left with", () {

      test("a server failure", () async {
        final  mockAdviceRepoImpl = MockAdviceRepoImpl();
        final mockAdviceUsecaseTest = AdviceUseCases(adviceRepo: mockAdviceRepoImpl);

        when(mockAdviceRepoImpl.getAdviseFromDataSource()).thenAnswer((i)=>Future.value(Left(ServerFailure())));
        final result = await mockAdviceUsecaseTest.getAdvise();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
        verify(mockAdviceRepoImpl.getAdviseFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);

      });


       test("a general  failure", () async {
        final  mockAdviceRepoImpl = MockAdviceRepoImpl();
        final mockAdviceUsecaseTest = AdviceUseCases(adviceRepo: mockAdviceRepoImpl);

        when(mockAdviceRepoImpl.getAdviseFromDataSource()).thenAnswer((i)=>Future.value(Left(GeneralFailure())));
        final result = await mockAdviceUsecaseTest.getAdvise();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));
        verify(mockAdviceRepoImpl.getAdviseFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);

      });



     });
   });
}