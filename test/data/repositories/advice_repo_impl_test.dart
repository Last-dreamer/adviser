


import 'package:adviser/data/datasources/advice_remote_datasource.dart';
import 'package:adviser/data/exceptions/exceptions.dart';
import 'package:adviser/data/models/advice_model.dart';
import 'package:adviser/data/repositories/advice_repo_impl.dart';
import 'package:adviser/domain/entities/advise_enitity.dart';
import 'package:adviser/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDataSourceImpl>()])
void main()async{

  group("Advice Repo Implementation", ()   { 
    group("should reunt advice entity", () { 


      test("when remote data source return advice model", ()async  {
      final mockAdviceRemoteDataSourceImpl = MockAdviceRemoteDataSourceImpl();
      final adviceRepoImplTest = AdviceRepoImpl(source: mockAdviceRemoteDataSourceImpl);


      when(mockAdviceRemoteDataSourceImpl.getRandomAdviceFromApi()).thenAnswer((i)=> Future.value(const AdviceModel(id: 1, advice: "test")));  

      final result = await adviceRepoImplTest.getAdviseFromDataSource();

      expect(result.isLeft(), false);
      expect(result.isRight(), true);
      expect(result, const Right<Failure, AdviceModel>(AdviceModel(advice: "test", id: 1)));

      verify(mockAdviceRemoteDataSourceImpl.getRandomAdviceFromApi()).called(1);
       verifyNoMoreInteractions(mockAdviceRemoteDataSourceImpl);

      });
    });


    group("should return left with", () {

      test("a server failure when ServerExceptioin occure...", () async {
        final adviceRemoteDataSource = MockAdviceRemoteDataSourceImpl();
        final adviceRepoImpTest = AdviceRepoImpl(source: adviceRemoteDataSource);
        when(adviceRemoteDataSource.getRandomAdviceFromApi()).thenThrow(ServerException());

        final result = await adviceRepoImpTest.getAdviseFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
      });

     });
  });

}