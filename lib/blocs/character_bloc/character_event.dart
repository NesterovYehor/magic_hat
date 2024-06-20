import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class FetchCharacters extends CharacterEvent {}

class GuessHouse extends CharacterEvent {
  final int characterIndex;
  final String house;

  const GuessHouse(this.house, this.characterIndex);

  @override
  List<Object> get props => [house];
}

class ResetCounters extends CharacterEvent {}

class LoadCharacterToHome extends CharacterEvent {
  final String characterId;

  LoadCharacterToHome(this.characterId);

}