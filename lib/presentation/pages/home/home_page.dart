import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smiring_app/presentation/router/page_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            context.push(PagePath.timezoneSimpleList);
          },
          icon: const Icon(Icons.watch_later_outlined),
        ),
      ),
    );
  }
}
