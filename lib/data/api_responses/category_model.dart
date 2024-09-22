import 'dart:convert';

import 'package:estore/core/api/end_points.dart';

List<CategoryModel> categoryModelFromJson(dynamic str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));
class CategoryModel
{
 final int id;
 final String name;
 final String image;
 final DateTime creationAt;
 final DateTime updatedAt;
CategoryModel(
      {required this.id,required this.name,required this.image,required this.creationAt, required this.updatedAt});
 factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
  id: json[ApiJsonKey.id],
  name: json[ApiJsonKey.name],
  image: json[ApiJsonKey.image],
  creationAt: DateTime.parse(json[ApiJsonKey.creationAt]),
  updatedAt: DateTime.parse(json[ApiJsonKey.updatedAt]),
 );
}