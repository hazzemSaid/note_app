import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/model/note_model.dart';

part 'getnotes_state.dart';

class GetnotesCubit extends Cubit<GetnotesState> {
  GetnotesCubit() : super(GetnotesInitial());

  void feachnote() {
    try {
      var box = Hive.box<NoteModel>('notes');
      var notes = box.values.toList();
      emit(GetnotesSuccess(notes: notes));
    } catch (e) {
      emit(GetnotesFauiler(massage: e.toString()));
    }
  }
}
