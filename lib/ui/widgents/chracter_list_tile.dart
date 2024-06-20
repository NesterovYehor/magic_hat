import 'package:flutter/material.dart';
import 'package:magic_hat/models/character_model.dart';
import 'package:magic_hat/ui/theme/text_styles.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile({super.key, required this.character, required this.onTap});

  final CharacterModel character;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Image.network(character.image, width: 50, height: 50), 
          const SizedBox(width: 10), 
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character.name, style: subTitleStyle),
                Text("Attempts: ${character.attempts}"), 
              ],
            ),
          ),
          if (character.guessed == false)
            GestureDetector(
              onTap: onTap,
              child: const Icon(Icons.replay_outlined, size: 40,)
            ),
            if (character.guessed != null)
            Icon(
              character.guessed == true ? Icons.check_circle : Icons.close,
              size: 40,
              color: character.guessed == true ? Colors.green : Colors.red,
            ),
        ],
      ),
    );
  }
}
