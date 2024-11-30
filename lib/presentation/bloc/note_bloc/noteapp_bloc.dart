import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/model/note_model.dart';

part 'noteapp_event.dart';
part 'noteapp_state.dart';

class NoteappBloc extends Bloc<NoteappEvent,NoteappState> {
  NoteappBloc():super(NoteappInitial()){
    on<AddNoteEvent>(_addNote);
  }
  void _addNote(AddNoteEvent events,Emitter<NoteappState> emit){
    final currentState=state;
    emit(NotesLoading());
    if(currentState is NotesLoaded){
      final updatedNotes=List<NoteModel>.from(currentState.noteList)
      ..add(events.note);
     
      
      emit(NotesLoaded(updatedNotes));
    }
      else{
        emit(NotesLoaded([events.note]));
      }

    }
  }


