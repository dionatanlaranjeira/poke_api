import 'package:args/command_runner.dart';
import 'package:poke_api/src/commands/pokemons/subcommands/find_by_id_command.dart';
import 'package:poke_api/src/commands/pokemons/subcommands/find_by_name_command.dart';
import 'package:poke_api/src/repositories/pokemon_repository.dart';

class PokemonsCommand extends Command {
  @override
  String get description => 'Pokemons Operations';

  @override
  String get name => 'pokemons';

  PokemonsCommand() {
    final pokemonRepository = PokemonRepository();
    addSubcommand(FindByIdCommand(pokemonRepository));
    addSubcommand(FindByNameCommand(pokemonRepository));
  }
}
