import 'package:flutter/material.dart';
import 'package:note_app/cubit/getnotecubit/getnotes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import '../widgets/CustomTextfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Editnoteviewbody extends StatefulWidget {
  final NoteModel note;
  const Editnoteviewbody({super.key, required this.note});

  @override
  State<Editnoteviewbody> createState() => _EditnoteviewbodyState();
}

class _EditnoteviewbodyState extends State<Editnoteviewbody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  'Note App',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 45, 43, 43),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () {
                      widget.note.title = title ?? widget.note.title;
                      widget.note.description =
                          content ?? widget.note.description;
                      widget.note.save();
                      BlocProvider.of<GetnotesCubit>(context).feachnote();
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.check,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          CustomTextfield(
            onchange: (val) => title = val,
            hint: widget.note.title,
            maxline: 1,
          ),
          const SizedBox(
            width: double.infinity,
            height: 30,
          ),
          CustomTextfield(
            onchange: (val) => content = val,
            maxline: 5,
            hint: widget.note.description,
          ),
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
        ],
      ),
    );
  }
}
