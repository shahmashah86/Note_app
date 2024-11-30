part of 'noteapp_bloc.dart';


abstract class NoteappEvent{
 
}
class AddNoteEvent extends NoteappEvent {
  final NoteModel note;
  AddNoteEvent(this.note);
}