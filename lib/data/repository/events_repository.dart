import 'package:flutter/foundation.dart';

import '../models/events.dart';
import '../models/quote.dart';
import '../web_services/events_web_services.dart';

class EventsRepository {
  final EventsWebServices eventsWebServices;

  EventsRepository(this.eventsWebServices);

  Future<List<Events>> getAllEvents() async {
    final events = await eventsWebServices.getAllEventsWeb();
    return events.map((event) => Events.fromJson(event)).toList();
  }

  /*Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await eventsWebServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }*/
}
