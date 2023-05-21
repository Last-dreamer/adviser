
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/advice_model.dart';

abstract class AdviceRemoteDataSource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSouceImpl implements AdviceRemoteDataSource {
  final client = http.Client();
  @override
  Future<AdviceModel> getRandomAdviceFromApi()async  {

    var model = AdviceModel(advice: "", id: 0);

    var resp = await client.get(Uri.parse("https://api.flutter-community.com/api/v1/advice"), headers: {
      "content-type":"application/json"
    });

    var jsonBody = json.decode(resp.body);



    return model;
     
  }
}