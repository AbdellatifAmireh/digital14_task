import 'package:digital14_task/business_logic/cubit/events_cubit.dart';
import 'package:digital14_task/data/models/events.dart';
import 'package:digital14_task/data/repository/events_repository.dart';
import 'package:digital14_task/data/web_services/events_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';
import 'presentations/screens/event_details_screen.dart';
import 'presentations/screens/events_screen.dart';

class AppRouter {
  late EventsRepository eventsRepository;
  late EventsCubit eventsCubit;
  late List<String> favoriteDataList;

  AppRouter() {
    // Initialized a eventsRepository and eventsCubit in constructor
    eventsRepository = EventsRepository(EventsWebServices());
    eventsCubit = EventsCubit(eventsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case eventsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => eventsCubit,
            child: const EventsScreen(),
          ),
        );
      case eventDetailsScreen:
        final event = settings.arguments as Events;
        return MaterialPageRoute(builder: (_) => EventDetailsScreen(event: event));
    }
  }
}
