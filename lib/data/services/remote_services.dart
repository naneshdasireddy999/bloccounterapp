import 'dart:convert';

import 'package:bloccounterapp/data/models/counter_model.dart';

import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<Counter?> fetchcount() async {
    try {
      var response =
          await client.get(Uri.parse('http://localhost:3000/counts'));

      if (response.statusCode == 200) {
        var jsonstring = response.body;

        return counterFromJson(jsonstring);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print('avinash');
      // TODO
    }
  }

  static Future<void> patchcount(Counter c) async {
    try {
      var response = await client.patch(
        Uri.parse('http://localhost:3000/counts/'),
        body: jsonEncode({
          "count": c.count + 1,
        }),
        headers: {"Content-type": "application/json"},
      );
      print('nanesh');
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<void> resetcount(Counter c) async {
    try {
      var response = await client.patch(
        Uri.parse('http://localhost:3000/counts/'),
        body: jsonEncode({
          "count": 0,
        }),
        headers: {"Content-type": "application/json"},
      );
      print('nanesh');
    } on Exception catch (e) {
      // TODO
    }
  }
}
