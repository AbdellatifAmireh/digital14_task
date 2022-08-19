import '../models/events.dart';
import '../web_services/events_web_services.dart';

class EventsRepository {
  final EventsWebServices eventsWebServices;

  EventsRepository(this.eventsWebServices);

  Future<List<Events>> getAllEvents() async {
    final events = await eventsWebServices.getAllEventsWeb();
    return events.map((event) => Events.fromJson(event)).toList();
  }

}
