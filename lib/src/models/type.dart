import 'dart:convert';

class Types {
  final int slot;
  final Type type;

  Types({required this.slot, required this.type});

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'type': type.toMap(),
    };
  }

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      slot: map['slot'],
      type: Type.fromMap(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Types.fromJson(String source) =>
      Types.fromMap(json.decode(source));
}

class Type {
  String name;
  String url;

  Type({required this.name, required this.url});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Type.fromMap(Map<String, dynamic> map) {
    return Type(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Type.fromJson(String source) =>
      Type.fromMap(json.decode(source));
}
