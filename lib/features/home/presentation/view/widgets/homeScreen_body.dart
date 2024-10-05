import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/widgets/customcard.dart';

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
          child: ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCard(index: index),
            );
          }),
        )
      ],
    );
  }
}
