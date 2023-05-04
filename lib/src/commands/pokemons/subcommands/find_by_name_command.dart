import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:poke_api/src/repositories/pokemon_repository.dart';

class FindByNameCommand extends Command {
  final PokemonRepository pokemonRepository;

  @override
  String get description => 'Find Pokemon by Name';

  @override
  String get name => 'byName';

  FindByNameCommand(this.pokemonRepository) {
    argParser.addOption('name', abbr: 'n', help: 'Pokemon name');
  }

  @override
  Future<void> run() async {
    if (argResults?['name'] == null) {
      print('Informe um nome usando --name=nome ou -n nome');
      return;
    }

    final name = argResults?['name'];
    print('Buscando dados...');
    final pokemon = await pokemonRepository.findByName(name);
    print('Mostrar também os moves? (S ou N)');
    final showMoves = stdin.readLineSync();
    print('----------------------------------');
    print('''
ID: ${pokemon.id}
Pokemon ${pokemon.name.substring(0, 1).toUpperCase()}${pokemon.name.substring(1)}
Altura: ${pokemon.height / 10}m
Peso: ${(pokemon.weight / 4.53).toStringAsFixed(2)}lbs / ${pokemon.weight / 10}kg''');
    print('----------------------------------');
    print('Tipos:');
    for (var type in pokemon.types) {
      print(
          '${type.type.name.substring(0, 1).toUpperCase()}${type.type.name.substring(1)}');
    }
    print('----------------------------------');
    if (showMoves?.toLowerCase() == 's') {
      print('Moves:');
    }
    for (var move in pokemon.moves) {
      if (showMoves?.toLowerCase() == 's') {
        print(
            '${move.move.name.substring(0, 1).toUpperCase()}${move.move.name.substring(1)}');
      } else {
        return;
      }
    }
  }
}
