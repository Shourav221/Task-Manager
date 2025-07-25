import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:task_manager/Ui/controllers/auth_controller.dart';
import 'package:task_manager/Ui/screens/sign_In_Screen.dart';
import 'package:task_manager/app.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.errorMessage,
  });
}

class NetworkCaller {
  static const String _defaultErrorMessage = 'Something went wrong';
  static const String _unAuthorizeMessage = 'Un-authorize token';
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, null, null);
      Response response = await get(uri);
      _logResponse(url, response);
      if (response.statusCode == 200) {
        final decodeJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodeJson,
        );
      } else if (response.statusCode == 401) {
        _onUnAuthorize();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _unAuthorizeMessage,
        );
      } else {
        final decodeJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          errorMessage: decodeJson['data'] ?? _defaultErrorMessage,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: _defaultErrorMessage,
      );
    }
  }

  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, String>? body,
    bool isFromLogin = false
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final Map<String, String> headers = {
        'content-type': 'application/json',
        'token': AuthController.accessToken ?? '',
      };
      _logRequest(url, body, headers);
      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);
      if (response.statusCode == 200) {
        final decodeJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodeJson,
        );
      } else if (response.statusCode == 401) {
        if(isFromLogin) {
          _onUnAuthorize();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: _unAuthorizeMessage,
        );
      } else {
        final decodeJson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodeJson['data'] ?? _defaultErrorMessage,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: _defaultErrorMessage,
      );
    }
  }

  static void _logRequest(
    String url,
    Map<String, String>? body,
    Map<String, String>? headers,
  ) {
    debugPrint(
      '=========================Request=============================\n'
      'URL: $url\n'
      'HEADERS: $headers'
      'BODY: $body\n'
      '=====================================================================',
    );
  }

  static void _logResponse(String url, Response response) {
    debugPrint(
      '=========================Response=============================\n'
      'URL: $url\n'
      'STATUS CODE: ${response.statusCode}\n'
      'BODY: ${response.body}\n'
      '=====================================================================',
    );
  }

  static Future<void> _onUnAuthorize() async {
    await AuthController.clearUserData();
    Navigator.of(
      TaskManagerApp.navigator.currentContext!,
    ).pushNamedAndRemoveUntil(SignInScreen.name, (predicate) => false);
  }
}
