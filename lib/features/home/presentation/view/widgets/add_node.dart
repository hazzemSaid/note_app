import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/widgets/CustomTextfield.dart';

class AddNode extends StatelessWidget {
  const AddNode({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: addnoteform(),
    );
  }
}

class addnoteform extends StatefulWidget {
  const addnoteform({
    super.key,
  });

  @override
  State<addnoteform> createState() => _addnoteformState();
}

class _addnoteformState extends State<addnoteform> {
  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 29,
            ),
            CustomTextfield(
              onsave: (value) {
                title = value;
              },
              hint: 'title',
              maxline: 1,
            ),
            const SizedBox(
              width: double.infinity,
              height: 30,
            ),
            CustomTextfield(
              onsave: (value) {
                description = value;
              },
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
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      print(title);
                      print(description);
                      //add in hive
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
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
