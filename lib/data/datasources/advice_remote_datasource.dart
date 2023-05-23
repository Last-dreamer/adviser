
import 'dart:convert'; 

import 'package:adviser/data/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;

import '../models/advice_model.dart';

abstract class AdviceRemoteDataSource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDataSource {
  final http.Client client; 
  AdviceRemoteDataSourceImpl({required this.client});
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async  {
    var resp = await client.get(Uri.parse("https://api.flutter-community.com/api/v1/advice"),
     headers: {
      "content-type": "application/json"
    }); 
    if(resp.statusCode != 200){
      throw ServerException();
    }else{
        var jsonBody = json.decode(resp.body);
    return AdviceModel.fromJson(jsonBody);
    }
   
  }
}