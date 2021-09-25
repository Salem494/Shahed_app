import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shahed/models/model.dart';
import 'package:shahed/models/repo.dart';



part 'breakingbad_state.dart';

class BreakingbadCubit extends Cubit<BreakingbadState> {

  final CharacterRepository characterRepository;
  late List<Character> character;
  BreakingbadCubit(this.characterRepository) : super(BreakingbadInitial());

     List<Character> getData() {
    characterRepository.getData().then((character) {
      emit(BreakingCharacterLoaded(character!));
      this.character = character;
    });
    return character;
  }
}



