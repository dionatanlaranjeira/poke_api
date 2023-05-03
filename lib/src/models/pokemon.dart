import 'moves.dart';
import 'type.dart';
import 'dart:convert';

class Pokemon {
  final int id;
  final String name;
  final int height;
  final List<Types> types;
  final int weight;
  final List<Moves> moves;

  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.types,
    required this.weight,
    required this.moves,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'height': height,
      'types': types.map((x) => x.toMap()).toList(),
      'weight': weight,
      'moves': moves.map((x) => x.toMap()).toList(),
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'] as int,
      name: map['name'] as String,
      height: map['height'] as int,
      types: List<Types>.from(
        (map['types'] as List).map((x) => Types.fromMap(x as Map<String, dynamic>)),
      ),
      weight: map['weight'] as int,
      moves: List<Moves>.from(
        (map['moves'] as List).map((x) => Moves.fromMap(x as Map<String, dynamic>)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) => Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);
}
