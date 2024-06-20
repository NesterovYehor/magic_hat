import 'package:flutter/material.dart';
import 'package:magic_hat/extensions/loc.dart';
import 'package:magic_hat/models/character_model.dart';
import 'package:magic_hat/ui/theme/text_styles.dart';
import 'package:magic_hat/ui/widgents/screen_container.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: character.name,
      child: Container(
        margin: const EdgeInsets.all(25.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                character.image,
                width: MediaQuery.of(context).size.width * 0.35,
                fit: BoxFit.cover, 
              ),
            ),
            const SizedBox(width: 16.0),
            if(character.guessed == true)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "House: ${character.house}",
                    style: subTitleStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Date of birth: ${character.dateOfBirth}",
                    style: subTitleStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Actor: ${character.actor}",
                    style: subTitleStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Species: ${character.species}",
                    style: subTitleStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            if (character.guessed == false)
            Text(context.loc.access_denied, style: headlineStyle.copyWith(color: Colors.red,))
          ],
        ),
      ),
    );
  }
}
