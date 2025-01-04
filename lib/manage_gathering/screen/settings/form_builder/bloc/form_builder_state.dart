part of 'form_builder_bloc.dart';

class FormBuilderState {
  final List<FormBuilderModel> formList;
  FieldType? fieldType;
  String? formTitle;

  FormBuilderState({required this.formList, this.fieldType,this.formTitle});
}

class FormBuilderInitial extends FormBuilderState {
  FormBuilderInitial({required super.formList});
}
