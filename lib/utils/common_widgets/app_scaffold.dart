import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;

  const AppScaffold({super.key, required this.child, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: child),
    );
  }
}
