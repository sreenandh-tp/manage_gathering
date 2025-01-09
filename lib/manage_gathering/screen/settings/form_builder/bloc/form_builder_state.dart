part of 'form_builder_bloc.dart';

class FormBuilderState {
  final List<FormBuilderModel> formList;
  FieldType? fieldType;
  String? formTitle;
  bool enableRegisterForm;

  FormBuilderState(
      {required this.formList,
      this.fieldType,
      this.formTitle,
     required this.enableRegisterForm});
}

class FormBuilderInitial extends FormBuilderState {
  FormBuilderInitial({required super.formList,required super.enableRegisterForm});
}
