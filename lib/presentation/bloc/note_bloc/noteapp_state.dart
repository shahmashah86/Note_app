part of 'noteapp_bloc.dart';

@immutable
abstract class NoteappState  {

}

final class NoteappInitial extends NoteappState {}

final class NotesLoading extends NoteappState{}

class NotesLoaded extends NoteappState{
 final List<NoteModel> noteList;
 NotesLoaded(this.noteList);


}