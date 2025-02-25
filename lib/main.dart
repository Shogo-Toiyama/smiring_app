import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiring_app/presentation/router/router.dart';

void main() {
  final app = kReleaseMode
    ? const ProviderScope(child: MyApp())
    : DevicePreview(
        enabled: true,
        builder: (context) => const ProviderScope(child: MyApp())
      );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = RouterClass().getRouter();
    return MaterialApp.router(
      title: 'SmiRing App',
      builder: DevicePreview.appBuilder,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}