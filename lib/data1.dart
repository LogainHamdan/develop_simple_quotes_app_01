// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String provider;
  String license;
  String terms;
  String url;
  Size size;

  Welcome({
    required this.provider,
    required this.license,
    required this.terms,
    required this.url,
    required this.size,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        provider: json["provider"],
        license: json["license"],
        terms: json["terms"],
        url: json["url"],
        size: Size.fromJson(json["size"]),
      );

  Map<String, dynamic> toJson() => {
        "provider": provider,
        "license": license,
        "terms": terms,
        "url": url,
        "size": size.toJson(),
      };
}

class Size {
  String height;
  String width;

  Size({
    required this.height,
    required this.width,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
      };
}
