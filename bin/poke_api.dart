import 'package:args/command_runner.dart';
import 'package:poke_api/poke_api.dart' as poke_api;
import 'package:poke_api/src/commands/pokemons/pokemons_command.dart';

void main(List<String> arguments) {
  CommandRunner('PokeAPI Busca', 'Buscar pokemons PokeAPI')
    ..addCommand(PokemonsCommand())
    ..run(arguments);
}
