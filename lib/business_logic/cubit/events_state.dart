part of 'events_cubit.dart';

// This class to define any class is state
@immutable
abstract class EventsState {}

class EventsInitial extends EventsState {}

// When the Events list is loaded
class EventsLoaded extends EventsState {
  final List<Events> events;

  EventsLoaded(this.events);
}
