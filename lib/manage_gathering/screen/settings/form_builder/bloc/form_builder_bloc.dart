

import 'package:bloc/bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/model/form_builder_model.dart';
import 'package:meta/meta.dart';

part 'form_builder_event.dart';
part 'form_builder_state.dart';

class FormBuilderBloc extends Bloc<FormBuilderEvent, FormBuilderState> {
  FormBuilderBloc() : super(FormBuilderInitial(singleLineFormModelList: [])) {
    on<AddSingleLineFormEvent>((event, emit) {
      state.singleLineFormModelList.add(event.singleLineFormModel);

      emit(FormBuilderState(
          singleLineFormModelList: state.singleLineFormModelList));
    });
  }
}
