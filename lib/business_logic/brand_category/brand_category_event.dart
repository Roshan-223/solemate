abstract class HomeEvent {}

class SelectBrandEvent extends HomeEvent {
  final String brand;

  SelectBrandEvent(this.brand);

}

class ResetBrandEvent extends HomeEvent {}