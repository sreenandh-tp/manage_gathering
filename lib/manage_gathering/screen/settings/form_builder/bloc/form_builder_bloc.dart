import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../model/form_builder_model.dart';
part 'form_builder_event.dart';
part 'form_builder_state.dart';

class FormBuilderBloc extends Bloc<FormBuilderEvent, FormBuilderState> {
  FormBuilderBloc() : super(FormBuilderInitial(formList: [])) {
    on<AddFormsEvent>((event, emit) {
      state.formList.add(event.formBuilderModel);

      emit(FormBuilderState(formList: state.formList));
    });
  }
}
