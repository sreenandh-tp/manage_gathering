import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'drop_down_event.dart';
part 'drop_down_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc() : super(DropDownInitial(textFields: [TextEditingController()])) {
    on<AddDropDownTextFieldEvent>((event, emit) {
        final currentList = List<TextEditingController>.from(state.textFields);
      currentList.insert(0, TextEditingController());

      emit(DropDownState(textFields: currentList));
    
    });

     on<DeleteDropDownTextFieldEvent>(
      (event, emit) {
        if (state.textFields.length > 1) {
          final currentList =
              List<TextEditingController>.from(state.textFields);
          currentList[event.index].dispose();
          currentList.removeAt(event.index);
          emit(DropDownState(textFields: currentList));
        }
      },
    );


  }
}
