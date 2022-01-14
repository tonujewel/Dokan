import 'dart:convert';

import 'package:dokani/utils/app_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'custom_exception.dart';

class APIManager {
  static Future<dynamic> postAPICall(
      {required String url,
      Map<String, String>? body,
      Map<String, String>? header}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode(body);
      request.headers.addAll(header!);
      http.StreamedResponse res = await request.send();
      var response = await http.Response.fromStream(res)
          .timeout(const Duration(minutes: 1));

      print('URL>>' + url);
      print('RESPONSE>>' + response.body);

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }

  static Future<dynamic> getAPICall(
      {required String url, Map<String, String>? header}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 30));

      print("URL:: $url");
      print("RESPONSE:: ${response.body}");

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }
}

dynamic _response(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body) as Map<String, dynamic>;
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
      throw InternalServerError(response.body.toString());
    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
  }
}

void apiErrorMessage(String msg) {
  if (msg == "Time Out: null") {
    errorSnackbar("Network time out");
  } else if (msg == "Error_no_internet") {
    errorSnackbar("Check your internet connection");
  } else {
    errorSnackbar(msg);
  }
}

// void printResponse(
//     {required url, body, required response, required statusCOde}) {
//   if (kDebugMode) {

//   }
// }
