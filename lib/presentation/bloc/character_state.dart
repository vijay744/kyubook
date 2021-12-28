import 'package:kyubook/data/models/model_character.dart';

abstract class CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterSuccess extends CharacterState {
  final ModelCharacter characterList;

  CharacterSuccess({required this.characterList});
}

class CharacterFailuer extends CharacterState {
  final String message;

  CharacterFailuer({required this.message});
}
