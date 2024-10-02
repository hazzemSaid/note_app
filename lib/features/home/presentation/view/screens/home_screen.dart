import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/widgets/homeScreen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Note App'),
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 45, 43, 43),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.search),
            )
          ],
        ),
      ),
      body: const HomeScreen_body(),
    );
  }
}
