import 'package:flutter/material.dart';
import 'package:magic_hat/extensions/loc.dart';
import 'package:magic_hat/ui/widgents/stat_box.dart';

class StatRow extends StatelessWidget {
  const StatRow({super.key, required this.total, required this.success, required this.failed});

  final int total;
  final int success;
  final int failed;

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatBox(label: context.loc.total, value: total),
              StatBox(label: context.loc.success, value: success),
              StatBox(label: context.loc.failed, value: failed),
            ],
          );
  }
}