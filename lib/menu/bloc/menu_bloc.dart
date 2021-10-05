

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infitest/menu/bloc/menu_event.dart';
import 'package:infitest/menu/bloc/menu_state.dart';
import 'package:infitest/menu/models/menu_repository.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {

  final MenuRepository _menuRepository = MenuRepository();

  MenuBloc(MenuState initialState) : super(InitialState());

  MenuState get initialState => InitialState();

  @override
  Stream<MenuState> mapEventToState(
      MenuEvent event,
      ) async* {
    if (event is GetAllMenu) {
      try {
        yield LoadingState();
        final menus = await _menuRepository.fetchMenus();
        yield LoadedState(menus);
        if (menus.error != null) {
          yield ErrorState(menus.error);
        }
      } on NetworkError {
        yield ErrorState("Failed to fetch data. is your device online?");
      }
    }
  }
}