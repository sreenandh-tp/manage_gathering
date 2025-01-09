import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../model/form_builder_model.dart';
part 'form_builder_event.dart';
part 'form_builder_state.dart';

class FormBuilderBloc extends Bloc<FormBuilderEvent, FormBuilderState> {
  FormBuilderBloc()
      : super(FormBuilderInitial(
          formList: [],
          enableRegisterForm: false,
        )) {
    on<AddFormsEvent>((event, emit) {
      state.formList.add(event.formBuilderModel);

      log(state.formList.map(
        (e) {
          return e.toJson();
        },
      ).toString());

      emit(FormBuilderState(
          formList: state.formList,
          enableRegisterForm: state.enableRegisterForm));
    });

    on<SelectedFieldTypeEvent>(
      (event, emit) {
        emit(FormBuilderState(
            formList: state.formList,
            fieldType: event.fieldType,
            enableRegisterForm: state.enableRegisterForm));
      },
    );

    on<ReOrderableListEvent>(
      (event, emit) {
        final FormBuilderModel updatedList =
            state.formList.removeAt(event.oldIndex);

        state.formList.insert(event.newIndex, updatedList);

        emit(FormBuilderState(
            formList: state.formList,
            enableRegisterForm: state.enableRegisterForm));
      },
    );

    on<AddFormTitleEvent>(
      (event, emit) {
        emit(FormBuilderState(
            formList: state.formList,
            formTitle: event.formTitle,
            enableRegisterForm: state.enableRegisterForm));
      },
    );

    on<EnableRegisterFormEvent>(
      (event, emit) {
        emit(FormBuilderState(
            formList: state.formList,
            enableRegisterForm: !state.enableRegisterForm));
      },
    );
  }
}
