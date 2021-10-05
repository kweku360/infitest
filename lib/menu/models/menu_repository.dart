import 'package:infitest/menu/models/menu.dart';
import 'package:infitest/menu/models/menu_api.dart';
/* Simple repository to get data */
class MenuRepository{
  final _menuApi = MenuApi();

  Future<Menu> fetchMenus(){
    return _menuApi.getMenu();
  }
}

class NetworkError extends Error {}