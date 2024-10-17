import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/model/note_model.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());
  addnote(NoteModel note) async {
    emit(AddnoteLoading());
    try {
      var box = Hive.box<NoteModel>('notes');
      await box.add(note);
      emit(AddnoteSuccess());
    } catch (e) {
      emit(AddnoteError(e.toString()));
    }
  }
}
