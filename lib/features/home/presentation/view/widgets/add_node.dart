import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/widgets/CustomTextfield.dart';

class AddNode extends StatelessWidget {
  const AddNode({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 20,
          ),
          CustomTextfield(
            hint: 'title',
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
          ),
          CustomTextfield(
            hint: 'description',
          ),
        ],
      ),
    );
  }
}

InputBorder customborder([Color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(
      color: Color ?? Colors.black,
      width: 2,
    ),
  );
}
