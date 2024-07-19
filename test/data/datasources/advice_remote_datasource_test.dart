// import 'package:mockito/mockito.dart';

import 'package:adviser/data/datasources/advice_remote_datasource.dart';
import 'package:adviser/data/exceptions/exceptions.dart';
import 'package:adviser/data/models/advice_model.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'advice_remote_datasource_test.mocks.dart';


@GenerateNiceMocks([MockSpec<http.Client>()])
void main(){
  group("Advice Remote DataSource ", () {
    group("should return advice model", () { 
      test("when response is 200 and valid data", ()async  {
        final mockClient  =  MockClient();
        final adviceRemoteDataSourceTest = AdviceRemoteDataSourceImpl(client: mockClient);
        const responseBody = '{"advice":"test advice", "advice_id":1}';

        when(mockClient.get(Uri.parse("https://api.flutter-community.com/api/v1/advice"), headers: {
          "content-type":"application/json"
        })).thenAnswer((realInvocation) => Future.value(http.Response(responseBody, 200)));
          final result = await adviceRemoteDataSourceTest.getRandomAdviceFromApi();

          expect(result, const AdviceModel(advice: "test advice", id: 1));
      });

    });    
   });

   group("throw an error", (){

     test("A ServerException when server response was not 200", () {
       final mockClient = MockClient();

      final adviceRemoteDataSourceTest = AdviceRemoteDataSourceImpl(client: mockClient); 

      when(mockClient.get(Uri.parse("https://api.flutter-community.com/api/v1/advice"), 
      headers: {
        "content-type": "application/json"
      })).thenAnswer((realInvocation) => Future.value(http.Response("",201)));
      expect(()=> adviceRemoteDataSourceTest.getRandomAdviceFromApi(), throwsA(isA<ServerException>()));
     });


     test("A type error when response is equal to 200 but data is not valid", (){
        final mockClient = MockClient();
        final adviceRemoteDataSourceTest = AdviceRemoteDataSourceImpl(client: mockClient);

        const  responseBody = '{"advice":"test advice"}';

        when(mockClient.get(Uri.parse("https://api.flutter-community.com/api/v1/advice"), headers: {
          "content-type": "application/json"
        })).thenAnswer((realInvocation) => Future.value(http.Response(responseBody, 200)));
        
        expect(()=> adviceRemoteDataSourceTest.getRandomAdviceFromApi(), throwsA(isA<TypeError>()));
     });
   });
}