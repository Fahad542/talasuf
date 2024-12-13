import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../../../Models/login.dart';
import '../../../Models/services.dart';
import 'Api_url.dart';
import 'Baseapiservices.dart';
import 'Networkapiservices.dart';

class Api {


   BaseApiServices api= NetworkApiService();
   Future<LoginResponse> loginapi(String username, String password) async
   {
     var body = {
       "username" : username,
       "password" : password
     };
    dynamic response = await api.getPostApiResponse("${Appurl.baseurl}loginservice.php",body );
    return response=LoginResponse.fromJson(response);
   }

   Future<ServiceResponse> services() async
   {
     var body = {};
     dynamic response = await api.getPostApiResponse("${Appurl.baseurl}fetch_services.php",body );
     return response=ServiceResponse.fromJson(response);
   }




}