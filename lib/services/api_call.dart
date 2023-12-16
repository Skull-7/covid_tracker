import 'dart:convert';

import 'package:covid_tracker/services/utlities/app_url.dart';

import '../model/country_detail_model.dart';
import '../model/world_states_model.dart';
import 'package:http/http.dart' as http;

class apicall{
  Future<WorldStatesModel> getdata() async{
    final responce=await http.get(Uri.parse(app_url.worldstateapi));
    if(responce.statusCode==200){
      var data=jsonDecode(responce.body.toString());
      return WorldStatesModel.fromJson(data);
    }
    else{
      throw Exception("Error");
    }
  }
}

class apiCountrycall{
  List<CountryDetailModel> country_list=[];
  Future<List<dynamic>> getcountrydata() async{
    final response=await http.get(Uri.parse(app_url.contrieslist));
    var data;
    if(response.statusCode==200){
      data=jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception("Error");
    }
  }
}