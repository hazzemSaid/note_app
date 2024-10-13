import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/widgets/add_node.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;

  const CustomTextfield({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        border: customborder(Colors.white),
        focusedBorder: customborder(Colors.white),
      ),
    );
  }
}
