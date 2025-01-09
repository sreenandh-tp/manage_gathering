import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'radio_option_form_event.dart';
part 'radio_option_form_state.dart';

class RadioOptionFormBloc
    extends Bloc<RadioOptionFormEvent, RadioOptionFormState> {
  RadioOptionFormBloc()
      : super(RadioOptionFormInitial(textFields: [TextEditingController()])) {
    on<AddFiledOptionEvent>((event, emit) {
      final currentList = List<TextEditingController>.from(state.textFields);
      currentList.insert(0, TextEditingController());

      emit(RadioOptionFormState(textFields: currentList));
    });

    on<DeleteFieldOptionEvent>(
      (event, emit) {
        if (state.textFields.length > 1) {
          final currentList =
              List<TextEditingController>.from(state.textFields);
          currentList[event.index].dispose();
          currentList.removeAt(event.index);
          emit(RadioOptionFormState(textFields: currentList));
        }
      },
    );
  }
}
