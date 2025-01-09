import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'multi_checkbox_event.dart';
part 'multi_checkbox_state.dart';

class MultiCheckboxBloc extends Bloc<MultiCheckboxEvent, MultiCheckboxState> {
  MultiCheckboxBloc()
      : super(MultiCheckboxInitial(textFields: [TextEditingController()])) {
    on<AddMultiTextFiledEvent>((event, emit) {
      final currentList = List<TextEditingController>.from(state.textFields);
      currentList.insert(0, TextEditingController());

      emit(MultiCheckboxState(textFields: currentList));
    });

    on<DeleteMultiTextFiledEvent>(
      (event, emit) {
        if (state.textFields.length > 1) {
          final currentList =
              List<TextEditingController>.from(state.textFields);
          currentList[event.index].dispose();
          currentList.removeAt(event.index);
          emit(MultiCheckboxState(textFields: currentList));
        }
      },
    );
  }
}
