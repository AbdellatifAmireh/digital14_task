import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../data/models/events.dart';
import '../../data/repository/events_repository.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepository eventsRepository;
  List<Events> eventsList = [];

  EventsCubit(this.eventsRepository) : super(EventsInitial());

  List<Events> getAllEventsCubit() {
    eventsRepository.getAllEvents().then((events) {
      emit(EventsLoaded(events));
      eventsList = events;
    });
    return eventsList;
  }
}
