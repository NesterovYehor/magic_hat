import 'package:flutter/material.dart';
import 'package:magic_hat/extensions/loc.dart';
import 'package:magic_hat/ui/theme/text_styles.dart';

class GuessButton extends StatelessWidget {
  const GuessButton({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: title.isNotEmpty ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          color: Theme.of(context).colorScheme.secondary
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title.isNotEmpty)
            Image.asset("assets/images/$title.png", width: 50, height: 50,),
            Text(title.isNotEmpty ? title : context.loc.not_in_house, style: subTitleStyle,)
          ],
        ),
      ),
    );
  }
}