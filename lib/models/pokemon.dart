// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Pokemon {
  String name;
  String url;
  String? frontDefaultSprite;
  List<String> types;
  int? height;
  int? weight;
  int? id;
  Color? primaryTypeColor;
  Color? secondaryTypeColor;

  Pokemon({
    required this.name,
    required this.url,
    this.frontDefaultSprite,
    required this.types,
    this.height,
    this.weight,
    this.id,
    this.primaryTypeColor,
    this.secondaryTypeColor,
  });

  Pokemon copyWith({
    String? name,
    String? url,
    String? frontDefaultSprite,
    List<String>? types,
    int? height,
    int? weight,
    int? id,
    Color? primaryTypeColor,
    Color? secondaryTypeColor,
  }) {
    return Pokemon(
      name: name ?? this.name,
      url: url ?? this.url,
      frontDefaultSprite: frontDefaultSprite ?? this.frontDefaultSprite,
      types: types ?? this.types,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      id: id ?? this.id,
      primaryTypeColor: primaryTypeColor ?? this.primaryTypeColor,
      secondaryTypeColor: secondaryTypeColor ?? this.secondaryTypeColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'frontDefaultSprite': frontDefaultSprite,
      'types': types,
      'height': height,
      'weight': weight,
      'id': id,
      'primaryTypeColor': primaryTypeColor?.value,
      'secondaryTypeColor': secondaryTypeColor?.value,
    };
  }

  // Uncomment this if you need to convert Pokemon object to a JSON string
  // String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var spriteData = json['sprites'] as Map<String, dynamic>? ?? {};
    var typeData = json['types'] as List<dynamic>? ?? [];

    List<String> types = typeData.map((typeItem) {
      return typeItem['type']['name'] as String;
    }).toList();

    return Pokemon(
      name: json['name'] as String? ?? 'Unknown',
      url: json['url'] as String? ?? 'Unknown',
      frontDefaultSprite: spriteData['front_default'] as String?,
      types: types,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      id: json['id'] as int?,
    );
  }

  @override
  String toString() {
    return 'Pokemon(name: $name, url: $url, frontDefaultSprite: $frontDefaultSprite, types: $types, height: $height, weight: $weight, id: $id, primaryTypeColor: $primaryTypeColor, secondaryTypeColor: $secondaryTypeColor)';
  }

  @override
  bool operator ==(covariant Pokemon other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.url == url &&
        other.frontDefaultSprite == frontDefaultSprite &&
        listEquals(other.types, types) &&
        other.height == height &&
        other.weight == weight &&
        other.id == id &&
        other.primaryTypeColor == primaryTypeColor &&
        other.secondaryTypeColor == secondaryTypeColor;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        url.hashCode ^
        frontDefaultSprite.hashCode ^
        types.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        id.hashCode ^
        primaryTypeColor.hashCode ^
        secondaryTypeColor.hashCode;
  }

  String toJson() => json.encode(toMap());

}
