import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyubook/data/repositories/character_repository.dart';

import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<FetchCharacterEvent, CharacterState> {
  final FetchRickNMortyRepository repository;

  CharacterBloc(initialState, {required this.repository})
      : super(initialState) {
    on<FetchCharactersFetchEvent>((event, emit) async {
      emit(CharacterLoading());
      final eitherResult = await repository.fetchCharacters();
      eitherResult.fold(
          (l) => emit(
              CharacterFailuer(message: l.message ?? "Something went wrong")),
          (characters) => emit(CharacterSuccess(characterList: characters)));
    });
  }
}
