import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/getnotecubit/getnotes_cubit.dart';
import 'package:note_app/features/home/presentation/view/widgets/customcard.dart';

import '../screens/editnoteview.dart';

class HomeScreen_body extends StatelessWidget {
  const HomeScreen_body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetnotesCubit, GetnotesState>(
      builder: (context, state) {
        if (state is GetnotesSuccess) {
          return Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 20,
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Editnoteview(
                                          note: state.notes[index])));
                            },
                            child: CustomCard(
                              index: index,
                              note: state.notes[index],
                            )),
                      );
                    }),
              ),
            ],
          );
        } else if (state is GetnotesFauiler) {
          return Center(child: Text(state.massage));
        }
        return CircularProgressIndicator();
      },
    );
  }
}
