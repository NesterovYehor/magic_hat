import 'package:equatable/equatable.dart';
import 'package:magic_hat/models/character_model.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharactersLoaded extends CharacterState {
  final List<CharacterModel> characters;
  final int total;
  final int success;
  final int failed;

  const CharactersLoaded(this.characters, {this.total = 0, this.success = 0, this.failed = 0});

  @override
  List<Object> get props => [characters, total, success, failed];
}

class CharacterError extends CharacterState {
  final String message;

  const CharacterError(this.message);

  @override
  List<Object> get props => [message];
}

