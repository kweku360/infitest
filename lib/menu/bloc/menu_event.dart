import 'package:equatable/equatable.dart';

/* Abstract  menu event class. */
abstract class MenuEvent extends Equatable {
  MenuEvent();
}
/* Single menu event for bloc - trigger menu fetch event*/
class GetAllMenu extends MenuEvent {
  @override
  List<Object> get props => [];
}