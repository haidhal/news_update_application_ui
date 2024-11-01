import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 1)
class Articlemodel {
  @HiveField(0)
  String? author;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? urlToImage;
  @HiveField(5)
  DateTime? publishedAt;
  @HiveField(6)
  String? content;
  @HiveField(7)
  String? category;
  

  Articlemodel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.category
  });
}
