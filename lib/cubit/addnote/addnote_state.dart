part of 'addnote_cubit.dart';

@immutable
abstract class AddnoteState {}

class AddnoteInitial extends AddnoteState {}

class AddnoteLoading extends AddnoteState {}

class AddnoteSuccess extends AddnoteState {}

class AddnoteError extends AddnoteState {
  final String message;

  AddnoteError(this.message);
}
