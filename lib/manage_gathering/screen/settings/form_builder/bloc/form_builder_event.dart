part of 'form_builder_bloc.dart';

@immutable
sealed class FormBuilderEvent {}

class AddFormsEvent extends FormBuilderEvent {
  final FormBuilderModel formBuilderModel;

  AddFormsEvent({required this.formBuilderModel});
}
