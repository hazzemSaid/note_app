import 'package:flutter/material.dart';
import 'package:note_app/core/routes/routes.dart';

void main() {
  runApp(const Note_app());
}

class Note_app extends StatelessWidget {
  const Note_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Note App',
      theme: ThemeData.dark(),
      routerConfig: Routes.router,
    );
  }
}
