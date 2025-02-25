import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:smiring_app/presentation/router/page_path.dart';

class WelcomePage extends HookWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    useEffect((){
      Future.microtask(() async {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          context.push(PagePath.home);
        } else {}
      });
      return null;
    }, []);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Image.asset(
                'assets/images/SmiRing_logo.png',
                height: constraints.maxHeight > constraints.maxWidth ? constraints.maxWidth : double.infinity,
                fit: BoxFit.cover,
              ),
            );
          },
           
        ),
      ),
    );
  }
}