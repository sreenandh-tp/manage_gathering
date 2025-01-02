part of 'form_builder_bloc.dart';

@immutable
sealed class FormBuilderEvent {}

class AddSingleLineFormEvent extends FormBuilderEvent {
  final SingleLineFormModel singleLineFormModel;

  AddSingleLineFormEvent({required this.singleLineFormModel});
}
