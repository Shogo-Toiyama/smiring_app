import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends HookWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    useEffect((){
      final sub = Future<void>(() async {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          context.goNamed('home');
        }
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