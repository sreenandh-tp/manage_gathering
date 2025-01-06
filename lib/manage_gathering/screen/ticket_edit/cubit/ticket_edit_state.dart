part of 'ticket_edit_cubit.dart';

class TicketEditState {
  final bool isAllowBulkBooking;
  final bool isApplyDiscount;
  final bool isAgeProofCheck;
  final int isRadioSelected;
  final bool isSwitchSelect;

  TicketEditState(
      {required this.isAllowBulkBooking,
      required this.isApplyDiscount,
      required this.isAgeProofCheck,
      required this.isRadioSelected,
      required this.isSwitchSelect});
}

final class TicketEditInitial extends TicketEditState {
  TicketEditInitial(
      {required super.isAllowBulkBooking,
      required super.isApplyDiscount,
      required super.isAgeProofCheck,
      required super.isRadioSelected,
      required super.isSwitchSelect});
}
