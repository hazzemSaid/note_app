import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/getnotecubit/getnotes_cubit.dart';
import 'package:note_app/features/home/presentation/view/widgets/add_node.dart';
import 'package:note_app/features/home/presentation/view/widgets/homeScreen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetnotesCubit()..feachnote(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  context: context,
                  builder: (context) {
                    return const AddNode();
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.add),
            )),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Note App'),
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 45, 43, 43),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.search),
              )
            ],
          ),
        ),
        body: const HomeScreen_body(),
      ),
    );
  }
}
