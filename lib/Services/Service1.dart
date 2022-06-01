// To parse this JSON data, do
//
//     final districtName = districtNameFromJson(jsonString);

import 'dart:convert';

List<DistrictName> districtNameFromJson(String str) => List<DistrictName>.from(
    json.decode(str).map((x) => DistrictName.fromJson(x)));

String districtNameToJson(List<DistrictName> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DistrictName {
  DistrictName({
    required this.name,
    required this.value,
  });

  String name;
  String value;

  factory DistrictName.fromJson(Map<String, dynamic> json) => DistrictName(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
