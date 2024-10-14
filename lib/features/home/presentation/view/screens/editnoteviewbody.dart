import 'package:flutter/material.dart';

import '../widgets/CustomTextfield.dart';

class Editnoteviewbody extends StatelessWidget {
  const Editnoteviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 50,
        ),
        const CustomTextfield(
          hint: 'title',
          maxline: 1,
        ),
        const SizedBox(
          width: double.infinity,
          height: 30,
        ),
        const CustomTextfield(
          maxline: 5,
          hint: 'description',
        ),
        const SizedBox(
          width: double.infinity,
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: GestureDetector(
              child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
        ),
      ],
    );
  }
}
