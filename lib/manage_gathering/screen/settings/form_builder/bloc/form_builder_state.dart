part of 'form_builder_bloc.dart';

class FormBuilderState {
  final List<FormBuilderModel> formList;
  FieldType? fieldType;

  FormBuilderState({required this.formList,this.fieldType});
}

class FormBuilderInitial extends FormBuilderState {
  FormBuilderInitial({required super.formList});
}
