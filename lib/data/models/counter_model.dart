// To parse this JSON data, do
//
//     final counter = counterFromJson(jsonString);

import 'dart:convert';

Counter counterFromJson(String str) => Counter.fromJson(json.decode(str));

String counterToJson(Counter data) => json.encode(data.toJson());

class Counter {
  Counter({
    required this.count,
  });

  int count;

  factory Counter.fromJson(Map<String, dynamic> json) => Counter(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}
