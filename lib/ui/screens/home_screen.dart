import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_hat/blocs/character_bloc/character_bloc.dart';
import 'package:magic_hat/blocs/character_bloc/character_event.dart';
import 'package:magic_hat/blocs/character_bloc/character_state.dart';
import 'package:magic_hat/extensions/loc.dart';
import 'package:magic_hat/models/character_model.dart';
import 'package:magic_hat/ui/theme/text_styles.dart';
import 'package:magic_hat/ui/widgents/guess_button.dart';
import 'package:magic_hat/ui/widgents/screen_container.dart';
import 'package:magic_hat/ui/widgents/stat_row.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      topBarAction: GestureDetector(
        onTap: () => context.read<CharacterBloc>().add(ResetCounters()),
        child: Text(context.loc.reset, style: subTitleStyle,),
      ),
      title: context.loc.home_screen,
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {      
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharactersLoaded) {
            final character = state.characters[state.total];
            return Column(
              children: [
                StatRow(
                  total: state.total, 
                  success: state.success, 
                  failed: state.failed
                ),
                const SizedBox(height: 20,),
                if (character.image.isNotEmpty)
                  Image.network(character.image, height: MediaQuery.of(context).size.height * 0.25,),
                  Text(character.name, style:  titleStyle,),
                  GuessButtons(character: character, index: state.total,),
              ],
            );
          } else if (state is CharacterError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text(context.loc.something_went_wrong));
          }
        },
      ),
    );
  }
}

class GuessButtons extends StatelessWidget {
  final CharacterModel character;
  final int index;
  const GuessButtons({super.key, required this.character, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GuessButton(
              title: context.loc.gryffindor, 
              onTap: () => context.read<CharacterBloc>().add(GuessHouse(context.loc.gryffindor, index)),
            ),
            GuessButton(
              title: context.loc.slytherin, 
              onTap: () => context.read<CharacterBloc>().add(GuessHouse(context.loc.slytherin, index))
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GuessButton(
              title: context.loc.ravenclaw, 
              onTap: () => context.read<CharacterBloc>().add(GuessHouse(context.loc.ravenclaw, index))
            ),
            GuessButton(
              title: context.loc.hufflepuff, 
              onTap: () => context.read<CharacterBloc>().add(GuessHouse(context.loc.hufflepuff, index))
            ),
          ],
        ),
        GuessButton(
          title: "", 
          onTap: () => context.read<CharacterBloc>().add(GuessHouse("", index))
        ),
      ],
    );
  }
}

