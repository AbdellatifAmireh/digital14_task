import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(EventsApp(appRouter: AppRouter(),));
}

class EventsApp extends StatelessWidget {
  const EventsApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}