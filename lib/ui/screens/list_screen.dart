import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_hat/blocs/character_bloc/character_bloc.dart';
import 'package:magic_hat/blocs/character_bloc/character_event.dart';
import 'package:magic_hat/blocs/character_bloc/character_state.dart';
import 'package:magic_hat/extensions/loc.dart';
import 'package:magic_hat/models/character_model.dart';
import 'package:magic_hat/ui/screens/character_datai_screen.dart';
import 'package:magic_hat/ui/widgents/chracter_list_tile.dart';
import 'package:magic_hat/ui/widgents/screen_container.dart';
import 'package:searchable_listview/searchable_listview.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenContainer(
      title: context.loc.list_screen,
      topBarAction: GestureDetector(
        onTap: () => context.read<CharacterBloc>().add(ResetCounters()),
        child: Text(context.loc.reset),
      ),
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterError) {
            return Center(child: Text(state.message));
          } else if (state is CharactersLoaded) {
            if (state.characters.isEmpty) {
              return Center(child: Text(context.loc.no_guessed_characters_found));
            }
            final characters = state.characters.where((character) => character.guessed != null).toList();
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SearchableList<CharacterModel>(
                  initialList: characters,
                  itemBuilder: (character) => GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CharacterDetailScreen(character: character))),
                    child: CharacterListTile(
                      character: character,
                      onTap: () => context.read<CharacterBloc>().add(LoadCharacterToHome(character.id)),
                    ),
                  ),
                  filter: (value) => characters.where((element) => 
                    element.name.toLowerCase().contains(value.toLowerCase())
                  ).toList(),
                  inputDecoration: InputDecoration(
                    labelText: context.loc.search_character,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text(context.loc.something_went_wrong));
          }
        },
      ),
    );
  }
}
