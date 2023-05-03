import 'dart:convert';

class Moves {
  Move move;

  Moves({required this.move});

  Map<String, dynamic> toMap() {
    return {
      'move': move.toMap(),
    };
  }

  factory Moves.fromMap(Map<String, dynamic> map) {
    return Moves(
      move: Move.fromMap(map['move']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Moves.fromJson(String source) => Moves.fromMap(json.decode(source));
}

class Move {
  String name;
  String url;

  Move({required this.name, required this.url});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Move.fromMap(Map<String, dynamic> map) {
    return Move(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Move.fromJson(String source) => Move.fromMap(json.decode(source));
}
