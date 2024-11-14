
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solemate/business_logic/brand_category/brand_category_event.dart';
import 'package:solemate/business_logic/brand_category/brand_category_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<SelectBrandEvent>((event, emit) {
      emit(HomeState(selectedBrand: event.brand));
    });
     on<ResetBrandEvent>((event, emit) {
      emit(HomeState(selectedBrand: 'All'));
    });
  }
}
