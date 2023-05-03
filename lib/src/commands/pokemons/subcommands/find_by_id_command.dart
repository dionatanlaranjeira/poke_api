import 'dart:io';

import 'package:args/command_runner.dart';
import '../../../repositories/pokemon_repository.dart';

class FindByIdCommand extends Command {
  final PokemonRepository pokemonRepository;
  @override
  String get description => 'Find Pokemon by Id';

  @override
  String get name => 'byId';

  FindByIdCommand(this.pokemonRepository) {
    argParser.addOption('id', help: 'Pokemon ID', abbr: 'i');
  }

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('Informe um ID de pokemon usando o comando --id=0 ou -i 0');
      return;
    }
    final id = int.parse(argResults?['id']);
    print('Buscando dados...');
    final pokemon = await pokemonRepository.findById(id);
    print('Mostrar também os moves? (S ou N)');
    final showMoves = stdin.readLineSync();
    print('----------------------------------');
    print('''
ID: ${pokemon.id}
Pokemon ${pokemon.name.substring(0, 1).toUpperCase()}${pokemon.name.substring(1)}
Altura: ${pokemon.height / 10}m
Peso: ${pokemon.weight / 4.53}lbs / ${pokemon.weight / 10}kg''');
    print('----------------------------------');
    print('Tipos:');
    for (var type in pokemon.types) {
      print('${type.type.name.substring(0, 1).toUpperCase()}${type.type.name.substring(1)}');
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
