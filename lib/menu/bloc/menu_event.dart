import 'package:equatable/equatable.dart';

abstract class MenuEvent extends Equatable {
  MenuEvent();
}

class GetAllMenu extends MenuEvent {
  @override
  List<Object> get props => [];
}