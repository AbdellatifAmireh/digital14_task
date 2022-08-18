import 'strings_private.dart';

// TODO: Add your own client_id from https://seatgeek.com/account/develop
const baseUrl =
    'https://api.seatgeek.com/2/events?client_id=$client_id&per_page=$perpage';
const eventsScreen = '/';
const eventDetailsScreen = '/event_details';
const perpage = 1000;
const allEventsUrl = 'https://api.seatgeek.com/2/events?client_id=$client_id';
const detailPageUrl =
    'https://api.seatgeek.com/2/events/5465630?client_id=$client_id';
