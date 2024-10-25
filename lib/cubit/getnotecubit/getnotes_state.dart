part of 'getnotes_cubit.dart';

@immutable
abstract class GetnotesState {}

class GetnotesInitial extends GetnotesState {}

class GetnotesSuccess extends GetnotesState {
  final List<NoteModel> notes;
  GetnotesSuccess({required this.notes});
}

class GetnotesFauiler extends GetnotesState {
  final String massage;

  GetnotesFauiler({required this.massage});
}
