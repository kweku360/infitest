import 'package:infitest/menu/models/menu.dart';
import 'package:infitest/menu/models/menu_api.dart';

class MenuRepository{
  final _menuApi = MenuApi();

  Future<Menu> fetchMenus(){
    return _menuApi.getMenu();
  }
}

class NetworkError extends Error {}