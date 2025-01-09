part of 'radio_option_form_bloc.dart';

@immutable
sealed class RadioOptionFormEvent {}

class AddFiledOptionEvent extends RadioOptionFormEvent {}

class DeleteFieldOptionEvent extends RadioOptionFormEvent {
  final int index;

  DeleteFieldOptionEvent({required this.index});
}
