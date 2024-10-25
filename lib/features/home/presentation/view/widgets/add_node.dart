import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/addnote/addnote_cubit.dart';

import 'add_note_form.dart';

class AddNode extends StatelessWidget {
  const AddNode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddnoteCubit>(
      create: (context) => AddnoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: BlocConsumer<AddnoteCubit, AddnoteState>(
          listener: (context, state) {
            if (state is AddnoteSuccess) {
              Navigator.pop(context);
            }
            if (state is AddnoteError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddnoteLoading ? true : false,
              child: const addNoteForm(),
            );
          },
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
