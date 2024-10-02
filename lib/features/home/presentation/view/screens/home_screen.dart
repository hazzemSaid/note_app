import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/widgets/homeScreen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const HomeScreen_body(),
    );
  }
}
