part of 'breakingbad_cubit.dart';

@immutable
abstract class BreakingbadState {}

class BreakingbadInitial extends BreakingbadState {}

class BreakingCharacterLoaded extends BreakingbadState {
  final List<Character> character;

  BreakingCharacterLoaded(this.character);

}


