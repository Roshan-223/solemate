abstract class NavigationEvent {}

class NavigationTabChanged extends NavigationEvent {
  final int newIndex;

  NavigationTabChanged(this.newIndex);
}