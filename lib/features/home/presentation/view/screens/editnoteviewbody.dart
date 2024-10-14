import 'package:flutter/material.dart';

import '../widgets/CustomTextfield.dart';

class Editnoteviewbody extends StatelessWidget {
  const Editnoteviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
        ),
        CustomTextfield(
          hint: 'title',
          maxline: 1,
        ),
        SizedBox(
          width: double.infinity,
          height: 30,
        ),
        CustomTextfield(
          maxline: 5,
          hint: 'description',
        ),
        SizedBox(
          width: double.infinity,
          height: 20,
        ),
      ],
    );
  }
}
