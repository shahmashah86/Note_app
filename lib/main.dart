import 'package:flutter_bloc/flutter_bloc.dart';import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/Screen/note_screen.dart';

import 'package:note_app/presentation/bloc/note_bloc/noteapp_bloc.dart';

void main(){
  runApp(BlocProvider(create: (context)=>NoteappBloc(),
  child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NoteScreen());
  }
}