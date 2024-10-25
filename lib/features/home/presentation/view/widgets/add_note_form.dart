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
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextfield(
                onsave: (value) {
                  title = value;
                },
                hint: 'title',
                maxline: 1,
              ),
              CustomTextfield(
                onsave: (value) {
                  description = value;
                },
                maxline: 6,
                hint: 'description',
              ),
              GestureDetector(onTap: () {
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
              }, child: BlocBuilder<AddnoteCubit, AddnoteState>(
                builder: (context, state) {
                  return Custom_Bottom(
                    isloading: state is AddnoteLoading ? true : false,
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class Custom_Bottom extends StatelessWidget {
  final bool isloading;

  const Custom_Bottom({super.key, this.isloading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: isloading
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
