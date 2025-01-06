import 'package:bloc/bloc.dart';

part 'ticket_edit_state.dart';

class TicketEditCubit extends Cubit<TicketEditState> {
  TicketEditCubit()
      : super(TicketEditInitial(
            isAllowBulkBooking: false,
            isApplyDiscount: false,
            isAgeProofCheck: false,
            isRadioSelected: 0));

  isAllowBulk() {
    emit(TicketEditState(
      isAllowBulkBooking: !state.isAllowBulkBooking,
      isAgeProofCheck: state.isAgeProofCheck,
      isApplyDiscount: state.isApplyDiscount,
      isRadioSelected: state.isRadioSelected,
    ));
  }

  isApplyDiscount() {
    emit(TicketEditState(
      isApplyDiscount: !state.isApplyDiscount,
      isAgeProofCheck: state.isAgeProofCheck,
      isAllowBulkBooking: state.isAllowBulkBooking,
      isRadioSelected: state.isRadioSelected,
    ));
  }

  isAgeProofCheck() {
    emit(TicketEditState(
      isAgeProofCheck: !state.isAgeProofCheck,
      isAllowBulkBooking: state.isAllowBulkBooking,
      isApplyDiscount: state.isApplyDiscount,
      isRadioSelected: state.isRadioSelected,
    ));
  }

  isSelectedRadio(int value) {
    emit(TicketEditState(
      isAgeProofCheck: state.isAgeProofCheck,
      isAllowBulkBooking: state.isAllowBulkBooking,
      isApplyDiscount: state.isApplyDiscount,
      isRadioSelected: value,
    ));
  }
}
