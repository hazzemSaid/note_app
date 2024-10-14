import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/widgets/CustomTextfield.dart';

class AddNode extends StatelessWidget {
  const AddNode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 29,
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