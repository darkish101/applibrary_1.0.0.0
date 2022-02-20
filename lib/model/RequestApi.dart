import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestApi {
  dynamic url;
  dynamic method;
  dynamic params;

  RequestApi({this.url, this.method, this.params});

  dynamic call() async {
    return await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': "*",
          "Access-Control-Allow-Methods": "${method}"
        },
        body: jsonEncode(params));
  }
}
