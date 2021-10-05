import 'package:equatable/equatable.dart';
import 'package:infitest/menu/models/menu.dart';

/* Specifies various states for Application */
abstract class MenuState extends Equatable {

}

class InitialState extends MenuState {
  InitialState();
  @override
  List<Object> get props => [];
}

class LoadingState extends MenuState {
  LoadingState();
  @override
  List<Object> get props => [];
}

class LoadedState extends MenuState {
  final Menu menu; //get menu object and populate to state
  LoadedState(this.menu);
  @override
  List<Object> get props => [menu];
}
/* class indicates an error state */
class ErrorState extends MenuState {
  final String? message;
  ErrorState(this.message);
  @override
  List<String?> get props => [message];
}