import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/view/screens/editnoteviewbody.dart';

class Editnoteview extends StatelessWidget {
  const Editnoteview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Editnoteviewbody(),
    );
  }
}
