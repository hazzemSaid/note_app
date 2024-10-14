import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/screens/editnoteviewbody.dart';

class Editnoteview extends StatelessWidget {
  const Editnoteview({super.key});

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
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.check,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ),
      body: const Editnoteviewbody(),
    );
  }
}
