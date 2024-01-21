import 'dart:convert';

class PokemonUrl {
  String name;
  String url;

  PokemonUrl({
    required this.name,
    required this.url,
  });


  PokemonUrl copyWith({
    String? name,
    String? url,
  }) {
    return PokemonUrl(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonUrl.fromMap(Map<String, dynamic> map) {
    return PokemonUrl(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  factory PokemonUrl.fromJson(Map<String, dynamic> json) {
    return PokemonUrl(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'PokemonUrl(name: $name, url: $url)';

  @override
  bool operator ==(covariant PokemonUrl other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
