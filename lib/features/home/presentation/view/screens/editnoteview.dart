import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/screens/editnoteviewbody.dart';
import 'package:note_app/model/note_model.dart';

class Editnoteview extends StatelessWidget {
  final NoteModel note;
  const Editnoteview({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Editnoteviewbody(note: note),
    );
  }
}
