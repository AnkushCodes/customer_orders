import 'dart:convert';
import 'dart:io';

import 'package:customer_order/api/custom_exception.dart';
import 'package:dio/dio.dart';

import 'base.dart';

class Api {
  Future<Response> getReq(String url, Dio dio) async {
    String urlSet = baseUrl + '/' + url + '?format=json';

    try {
      Response response = await dio.get(urlSet);
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }
}

dynamic _response(Response _response) {
  switch (_response.statusCode) {
    case 200:
      return _response;

    case 400:
      throw BadRequestException(_response.data.toString());
    case 401:
    case 403:
      throw UnauthorisedException(_response.data.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error Occured while  Communicating Server,Status Code :${_response.statusCode}');
  }
}
