import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_gathering_event.dart';
part 'manage_gathering_state.dart';

class ManageGatheringBloc
    extends Bloc<ManageGatheringEvent, ManageGatheringState> {
  ManageGatheringBloc() : super(ManageGatheringInitial(scrollSize: 65.0)) {
    const double maxSize = 65.0;
    const double minSize = 45.0;
    on<ScrollListenerEvent>((event, emit) {
      if (event.offsetValue != state.scrollSize) {
        emit(ManageGatheringState(
            scrollSize: (maxSize - event.offsetValue).clamp(minSize, maxSize)));
      }
    });
  }
}
