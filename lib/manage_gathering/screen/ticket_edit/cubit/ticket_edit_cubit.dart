import 'package:bloc/bloc.dart';

part 'ticket_edit_state.dart';

class TicketEditCubit extends Cubit<TicketEditState> {
  TicketEditCubit()
      : super(TicketEditInitial(
            isAllowBulkBooking: false,
            isApplyDiscount: false,
            isAgeProofCheck: false,
            isRadioSelected: 0,
            isSwitchSelect: false));

  isAllowBulk() {
    emit(TicketEditState(
        isAllowBulkBooking: !state.isAllowBulkBooking,
        isAgeProofCheck: state.isAgeProofCheck,
        isApplyDiscount: state.isApplyDiscount,
        isRadioSelected: state.isRadioSelected,
        isSwitchSelect: state.isSwitchSelect));
  }

  isApplyDiscount() {
    emit(TicketEditState(
        isApplyDiscount: !state.isApplyDiscount,
        isAgeProofCheck: state.isAgeProofCheck,
        isAllowBulkBooking: state.isAllowBulkBooking,
        isRadioSelected: state.isRadioSelected,
        isSwitchSelect: state.isSwitchSelect));
  }

  isAgeProofCheck() {
    emit(TicketEditState(
        isAgeProofCheck: !state.isAgeProofCheck,
        isAllowBulkBooking: state.isAllowBulkBooking,
        isApplyDiscount: state.isApplyDiscount,
        isRadioSelected: state.isRadioSelected,
        isSwitchSelect: state.isSwitchSelect));
  }

  isSelectedRadio(int value) {
    emit(TicketEditState(
        isAgeProofCheck: state.isAgeProofCheck,
        isAllowBulkBooking: state.isAllowBulkBooking,
        isApplyDiscount: state.isApplyDiscount,
        isRadioSelected: value,
        isSwitchSelect: state.isSwitchSelect));
  }

  isSwitchSelect() {
    emit(TicketEditState(
        isAgeProofCheck: state.isAgeProofCheck,
        isAllowBulkBooking: state.isAllowBulkBooking,
        isApplyDiscount: state.isApplyDiscount,
        isRadioSelected: state.isRadioSelected,
        isSwitchSelect: !state.isSwitchSelect));
  }
}
