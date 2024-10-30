import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/routes/routes.dart';
import 'package:note_app/cubit/getnotecubit/getnotes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/observer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
  Bloc.observer = MyBlocObserver();
  runApp(const Note_app());
}

class Note_app extends StatelessWidget {
  const Note_app({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetnotesCubit()..feachnote(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        theme: ThemeData.dark(),
        routerConfig: Routes.router,
      ),
    );
  }
}
