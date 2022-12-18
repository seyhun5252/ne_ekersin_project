import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class NetworkHandler {
  static Dio? _client;
  static final client = http.Client();

  static Future<String> post(var body, String endpoint) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var response = await http.post(Uri.parse(endpoint), body: body, headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });
    return response.body;
  }

  static Future<dynamic> get(String endpoint) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var response = await http.get(Uri.parse(endpoint), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });
    return response.body;
  }

  static Future<dynamic> getWeatherCity(String endpoint, String city) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var response = await http.get(Uri.parse(endpoint + city), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });
    return response.body;
  }

  static Future<String> delete(String endpoint, String id) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var response = await http.delete(Uri.parse("$endpoint?Id=$id"), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });
    return response.body;
  }
}
