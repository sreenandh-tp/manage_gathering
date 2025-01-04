part of 'manage_gathering_bloc.dart';

@immutable
sealed class ManageGatheringEvent {}

class ScrollListenerEvent extends ManageGatheringEvent {
  final double offsetValue;

  ScrollListenerEvent({required this.offsetValue});
}
