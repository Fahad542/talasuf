import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../response/app_exceptions.dart';
import 'Api_url.dart';
import 'Baseapiservices.dart';



class NetworkApiService extends BaseApiServices {


  @override
  Future getGetApiResponse(String url) async
  {
    dynamic responseJson ;
    try {

      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {

      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }


  @override
  Future getPostApiResponse( String url , dynamic data) async
  {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': Appurl.API_AUTH_TOKEN,
    };

    dynamic responseJson ;
    try {

      Response response = await post(
          Uri.parse(url),
          body: data,
          headers: headers,


      ).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);

    }on SocketException {

      throw FetchDataException('No Internet Connection');
    }

    return responseJson ;
  }

  dynamic returnResponse (http.Response response)
  {

    switch(response.statusCode)
    {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error accured while communicating with server'+
            'with status code' +response.statusCode.toString());
    }

  }

}