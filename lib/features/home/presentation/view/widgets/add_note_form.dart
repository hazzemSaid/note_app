import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
  int? indxcolor;
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
          height: 450,
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
              const SizedBox(
                height: 2,
              ),
              Listviewcolor(
                fn: (indx) {
                  setState(() {
                    indxcolor = indx;
                  });
                },
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(onTap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  var datenow = DateTime.now();
                  var format = DateFormat.yMEd().format(datenow);
                  print(indxcolor);
                  var note = NoteModel(
                    title: title!,
                    description: description!,
                    date: format,
                    color: indxcolor ?? Colors.cyan.value,
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

class Listviewcolor extends StatefulWidget {
  const Listviewcolor({super.key, required this.fn});
  final Function fn;
  @override
  State<Listviewcolor> createState() => _ListviewcolorState();
}

class _ListviewcolorState extends State<Listviewcolor> {
  int selected = 0;
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.grey,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selected = index;
                setState(() {
                  widget.fn(index);
                });
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.2),
                  child: Coloritem(
                    color: colors[index],
                    isselelcted: selected == index,
                  )),
            );
          }),
    );
  }
}

class Coloritem extends StatelessWidget {
  final bool isselelcted;
  final Color color;
  const Coloritem({super.key, required this.isselelcted, required this.color});
  @override
  Widget build(BuildContext context) {
    return isselelcted
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}
