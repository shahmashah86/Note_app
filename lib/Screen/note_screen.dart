import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/presentation/bloc/note_bloc/noteapp_bloc.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<NoteappBloc, NoteappState>(
        builder: (context, state) {
          if(state is NotesLoading){
            return const  CircularProgressIndicator();
          }
          if(state is NotesLoaded){
            return ListView.builder(itemCount:state.noteList.length,
              itemBuilder: (context, index) {
                final note=state.noteList[index];
            return ListTile(title: Text(note.title),subtitle: Text(note.content),
              
            );
          });

          }
          return const Text("No notes");
         
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddNoteDialog(context), child:const  Icon(Icons.add)),
    );
  }

  void _showAddNoteDialog(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add Note"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title')),
                TextField(
                    controller: contentController,
                    decoration: const InputDecoration(labelText: 'content'))
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                     final title = titleController.text;
                final content = contentController.text;

              
                  Navigator.of(context).pop();
              
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    final title = titleController.text;
                    final content = contentController.text;

                    if (title.isNotEmpty && content.isNotEmpty) {

                      
                  final newNote = NoteModel(title: title, content: content);
                  context.read<NoteappBloc>().add(AddNoteEvent(newNote));
                   Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Add"))
            ],
          );
        });
  }
}
