// To parse this JSON data, do
//
//     final welcome2 = welcome2FromJson(jsonString);

import 'dart:convert';

List<Welcome2> welcome2FromJson(String str) =>
    List<Welcome2>.from(json.decode(str).map((x) => Welcome2.fromJson(x)));

String welcome2ToJson(List<Welcome2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome2 {
  String id;
  String content;
  String author;
  List<String> tags;
  String authorSlug;
  int length;
  DateTime dateAdded;
  DateTime dateModified;

  Welcome2({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Welcome2.fromJson(Map<String, dynamic> json) => Welcome2(
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateAdded: DateTime.parse(json["dateAdded"]),
        dateModified: DateTime.parse(json["dateModified"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "authorSlug": authorSlug,
        "length": length,
        "dateAdded":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "dateModified":
            "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
      };
}
