import 'package:bloc/bloc.dart';
import 'package:magic_hat/models/character_model.dart';
import 'package:magic_hat/repositories/api_repository.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final ApiRepository apiRepository;

  CharacterBloc(this.apiRepository) : super(CharacterInitial()) {
    on<FetchCharacters>(_onFetchCharacters);
    on<GuessHouse>(_onGuessHouse);
    on<ResetCounters>(_onResetCounters);
    on<LoadCharacterToHome>(_onLoadCharacterToHome); 
  }

  void _onFetchCharacters(
      FetchCharacters event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());
    try {
      final characters = await apiRepository.fetchCharacters();
      characters.shuffle();
      emit(CharactersLoaded(characters));
    } catch (e) {
      print(e);
      emit(CharacterError(e.toString()));
    }
  }

  void _onGuessHouse(GuessHouse event, Emitter<CharacterState> emit) {
    if (state is CharactersLoaded) {
      final loadedState = state as CharactersLoaded;
      final character = loadedState.characters[event.characterIndex];
      final isSuccess = character.house == event.house;
      final updatedCharacters =
          List<CharacterModel>.from(loadedState.characters); 
      updatedCharacters[event.characterIndex] = character.copyWith(
        guessed: isSuccess,
        attempts: character.attempts + 1,
      );
      emit(CharactersLoaded(
        updatedCharacters,
        total: loadedState.total + 1,
        success: loadedState.success + (isSuccess ? 1 : 0),
        failed: loadedState.failed + (isSuccess ? 0 : 1),
      ));
    }
  }

  void _onResetCounters(ResetCounters event, Emitter<CharacterState> emit) {
    if (state is CharactersLoaded) {
      final loadedState = state as CharactersLoaded;
      emit(CharactersLoaded(
        loadedState.characters,
        total: 0,
        success: 0,
        failed: 0,
      ));
    }
  }

  void _onLoadCharacterToHome(
      LoadCharacterToHome event, Emitter<CharacterState> emit) {
    if (state is CharactersLoaded) {
      final loadedState = state as CharactersLoaded;
      final updatedCharacters =
          List<CharacterModel>.from(loadedState.characters);
      final characterToLoad = updatedCharacters.firstWhere(
          (character) => character.id == event.characterId);
        
        updatedCharacters.remove(characterToLoad);
        updatedCharacters.insert(loadedState.total, characterToLoad);
        emit(CharactersLoaded(
          updatedCharacters,
          total: loadedState.total,
          success: loadedState.success,
          failed: loadedState.failed,
        ));
    }
  }
}
