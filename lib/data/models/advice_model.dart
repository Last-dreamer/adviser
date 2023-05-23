

 
import 'package:equatable/equatable.dart';

import '../../domain/entities/advise_enitity.dart';

class AdviceModel extends AdviceEntity with EquatableMixin{
  
   const AdviceModel({required String advice, required int id}):super(advice:advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json){
   return AdviceModel(advice: json['advice'], id:json['advice_id']); 
  }
}