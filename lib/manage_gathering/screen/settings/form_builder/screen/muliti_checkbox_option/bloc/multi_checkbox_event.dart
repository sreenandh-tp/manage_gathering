part of 'multi_checkbox_bloc.dart';

@immutable
sealed class MultiCheckboxEvent {}

class AddMultiTextFiledEvent extends MultiCheckboxEvent {}

class DeleteMultiTextFiledEvent extends MultiCheckboxEvent {
  final int index;

  DeleteMultiTextFiledEvent({required this.index});
}
