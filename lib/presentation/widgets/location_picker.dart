import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationPicker extends ConsumerWidget {
  const LocationPicker({super.key, this.changeIndex});

  final int? changeIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(),
    );
  }
}
