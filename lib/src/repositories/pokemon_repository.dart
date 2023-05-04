import 'package:dio/dio.dart';
import 'package:poke_api/src/models/pokemon.dart';

class PokemonRepository {
  // Future<List<Pokemon>> findAll() async {
  //   try {
  //     final studentsResult = await Dio().get('https://pokeapi.co/api/v2/pokemon');

  //     return studentsResult.data.map((pokemon) {
  //       return Pokemon.fromMap(pokemon);
  //     }).toList();
  //   } on DioError catch (e) {
  //     print(e);
  //     throw Exception();
  //   }
  // }

  findById(int id) async {
    try {
      final pokemonResult =
          await Dio().get('https://pokeapi.co/api/v2/pokemon/$id');

      if (pokemonResult.data == null) {
        throw Exception("O resultado da requisição é nulo");
      }

      return Pokemon.fromMap(pokemonResult.data);
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  findByName(String name) async {
    try {
      final pokemonResult =
          await Dio().get('https://pokeapi.co/api/v2/pokemon/$name');

      if (pokemonResult.data == null) {
        throw Exception('O resultado da requisição é nulo');
      }

      return Pokemon.fromMap(pokemonResult.data);
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}
