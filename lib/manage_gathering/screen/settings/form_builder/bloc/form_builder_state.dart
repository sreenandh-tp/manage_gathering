part of 'form_builder_bloc.dart';

class FormBuilderState {
  final List<SingleLineFormModel> singleLineFormModelList;

  FormBuilderState({required this.singleLineFormModelList});
}

class FormBuilderInitial extends FormBuilderState {
  FormBuilderInitial({required super.singleLineFormModelList});
}
