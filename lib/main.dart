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
      theme: ThemeMode.system == ThemeMode.light
          ? ThemeData.light().copyWith(
              primaryColor: Colors.black12,
              hintColor: const Color.fromARGB(255, 78, 143, 255),
            )
          : ThemeData.dark().copyWith(
              primaryColor: Colors.white,
              hintColor: Colors.red,
            ),
      routerConfig: Routes.router,
    );
  }
}
