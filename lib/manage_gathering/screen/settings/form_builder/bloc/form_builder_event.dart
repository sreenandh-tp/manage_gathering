part of 'form_builder_bloc.dart';

@immutable
sealed class FormBuilderEvent {}

class AddFormsEvent extends FormBuilderEvent {
  final FormBuilderModel formBuilderModel;

  AddFormsEvent({required this.formBuilderModel});
}

class SelectedFieldTypeEvent extends FormBuilderEvent {
  final FieldType fieldType;

  SelectedFieldTypeEvent({required this.fieldType});
}

class ReOrderableListEvent extends FormBuilderEvent {
  final int newIndex;
  final int oldIndex;

  ReOrderableListEvent({required this.newIndex, required this.oldIndex});
}

class AddFormTitleEvent extends FormBuilderEvent {
  final String formTitle;

  AddFormTitleEvent({required this.formTitle});
}

class EnableRegisterFormEvent extends FormBuilderEvent {}
