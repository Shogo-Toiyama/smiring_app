import 'package:flutter/material.dart';

class InstagramPostAnalysisPage extends StatelessWidget {
  const InstagramPostAnalysisPage({super.key, required this.account});

  final String account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Instagram Post Analysis Page - $account')),
    );
  }
}