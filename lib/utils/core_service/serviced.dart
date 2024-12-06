import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

const String baseUrl = "https://test.vehup.com/api/";
String? token;

class VehoServices {
  /// Generic HTTP GET method
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + endpoint),
          headers: headers ??
              {
                'Authorization': 'Bearer $token',
                'Content-Type': 'application/json; charset=UTF-8',
              });
      return _handleResponse(response);
    } catch (e) {
      _showErrorToast(e.toString());
      return {'error': e.toString()};
    }
  }

  /// Generic HTTP POST method
  Future<dynamic> post(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json; charset=UTF-8',
            },
        body: body,
      );
      return _handleResponse(response);
    } catch (e) {
      _showErrorToast(e.toString());
      return {'error': e.toString()};
    }
  }

  /// Generic HTTP PUT method
  Future<dynamic> put(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await http.put(
        Uri.parse(baseUrl + endpoint),
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      _showErrorToast(e.toString());
      return {'error': e.toString()};
    }
  }

  /// Generic HTTP DELETE method
  Future<dynamic> delete(String endpoint,
      {Map<String, String>? headers}) async {
    try {
      final response =
          await http.delete(Uri.parse(baseUrl + endpoint), headers: headers);
      return _handleResponse(response);
    } catch (e) {
      _showErrorToast(e.toString());
      return {'error': e.toString()};
    }
  }

  /// Generic HTTP POST method
  Future<dynamic> login(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: headers,
        body: body,
      );
      return _handleResponse(response);
    } catch (e) {
      _showErrorToast(e.toString());
      return {'error': e.toString()};
    }
  }

  /// Handles the HTTP response
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body.toString());
      print(response.statusCode.toString());
      return jsonDecode(response.body);
    } else {
      print(response.body.toString());
      print(response.statusCode.toString());
      String errorMessage = response.body.isNotEmpty
          ? jsonDecode(response.body)['message'][0] ??
              jsonDecode(response.body)['message'] ??
              'Something went wrong'
          : 'Unknown error occurred';
      _showErrorToast(errorMessage);
      return {'error': 'HTTP ${response.statusCode}', 'message': errorMessage};
    }
  }

  /// Displays error toasts
  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: const Color(0xFFB00020),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
