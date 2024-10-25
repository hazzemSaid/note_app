import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/widgets/customcard.dart';

import '../screens/editnoteview.dart';

class HomeScreen_body extends StatelessWidget {
  const HomeScreen_body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 20,
        ),
        Flexible(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Editnoteview()));
                      },
                      child: CustomCard(index: index)),
                );
              }),
        ),
      ],
    );
  }
}
