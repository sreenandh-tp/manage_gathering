part of 'drop_down_bloc.dart';

class DropDownState {
  final List<TextEditingController> textFields;

  DropDownState({required this.textFields});
}

final class DropDownInitial extends DropDownState {
  DropDownInitial({required super.textFields});
}
