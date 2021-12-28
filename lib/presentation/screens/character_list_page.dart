import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyubook/presentation/bloc/character_bloc.dart';
import 'package:kyubook/presentation/bloc/character_event.dart';
import 'package:kyubook/presentation/bloc/character_state.dart';

import 'character_details_widget.dart';

class RickAndMortyChacactersListWidget extends StatefulWidget {
  const RickAndMortyChacactersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _RickAndMortyCharactersListWidgetState createState() =>
      _RickAndMortyCharactersListWidgetState();
}

class _RickAndMortyCharactersListWidgetState
    extends State<RickAndMortyChacactersListWidget> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<CharacterBloc>().add(FetchCharactersFetchEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<CharacterBloc>().add(FetchCharactersFetchEvent());
        },
        child: Container(
          constraints: const BoxConstraints.expand(),
          child:
              BlocBuilder<CharacterBloc, CharacterState>(builder: (ctx, state) {
            if (state is CharacterSuccess) {
              return ListView.builder(
                // separatorBuilder: (context, index) => const Divider(),
                itemCount: state.characterList.results.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterDetailsWidget(
                          RickNMortyCharacter:
                              state.characterList.results[index],
                        ),
                      )),
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              state.characterList.results[index].image,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    state.characterList.results[index].name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Location ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Flexible(
                                          // direction: Axis.horizontal,
                                          child: Text(
                                            state.characterList.results[index]
                                                .location.name,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Species ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        state.characterList.results[index]
                                            .species,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is CharacterFailuer) {
              return Center(
                  child: Text(
                state.message,
              ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}
