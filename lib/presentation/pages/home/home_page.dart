import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smiring_app/presentation/router/page_path.dart';
import 'package:smiring_app/presentation/widgets/basic_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Home', backButton: false,),
      body: Center(
        child: GridView.count(
          crossAxisCount: 5,
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            IconButton(
              onPressed: () {
                context.push(PagePath.timezoneSimpleList);
              },
              icon: const Icon(Icons.watch_later_outlined, size: 150),
            ),
          ],
        )
      ),
    );
  }
}
