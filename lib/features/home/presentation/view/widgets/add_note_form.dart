import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/addnote/addnote_cubit.dart';
import 'package:note_app/features/home/presentation/view/widgets/CustomTextfield.dart';
import 'package:note_app/model/note_model.dart';

class addNoteForm extends StatefulWidget {
  const addNoteForm({
    super.key,
  });

  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm> {
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
                      var note = NoteModel(
                        title: title!,
                        description: description!,
                        date: DateTime.now().toString(),
                        color: Colors.cyan.value,
                      );
                      BlocProvider.of<AddnoteCubit>(context).addnote(note);

                      formkey.currentState!.reset();
                      setState(() {
                        autovalidateMode = AutovalidateMode.disabled;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Note Added'),
                          duration: Duration(seconds: 2),
                        ),
                      );
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
