part of 'drop_down_bloc.dart';

@immutable
sealed class DropDownEvent {}

class AddDropDownTextFieldEvent extends DropDownEvent {}

class DeleteDropDownTextFieldEvent  extends DropDownEvent {
  final int index;

  DeleteDropDownTextFieldEvent ({required this.index});
}
