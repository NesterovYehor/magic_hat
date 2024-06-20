import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer({super.key, required this.child, required this.title, this.topBarAction});

  final Widget child;
  final String? title;
  final Widget? topBarAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(title ?? ''),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: topBarAction ?? Container(),
          )
        ],
      ),
      body: Column(
        children: [
          const Divider(color: Colors.black,),
          child
        ],
      ),
    );
  }
}