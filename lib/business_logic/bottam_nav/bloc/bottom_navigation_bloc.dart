

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solemate/business_logic/bottam_nav/bloc/bottom_navigation_event.dart';
import 'package:solemate/business_logic/bottam_nav/bloc/bottom_navigation_state.dart';


class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(0)) {
    on<NavigationTabChanged>((event, emit) {
      emit(NavigationState(event.newIndex));
    });
  }
}