import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/widgets/add_node.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;
  final int maxline;
  final void Function(String?)? onsave;
  final void Function(String?)? onchange;
  const CustomTextfield(
      {super.key,
      required this.hint,
      required this.maxline,
      this.onsave,
      this.onchange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: onchange,
      onSaved: onsave,
      maxLines: maxline,
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
