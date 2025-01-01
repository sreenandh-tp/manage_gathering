import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'form_builder_event.dart';
part 'form_builder_state.dart';

class FormBuilderBloc extends Bloc<FormBuilderEvent, FormBuilderState> {
  FormBuilderBloc() : super(FormBuilderInitial()) {
    on<FormBuilderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
