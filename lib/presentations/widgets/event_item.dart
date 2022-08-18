import 'package:digital14_task/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/strings.dart';
import '../../data/models/events.dart';

class EventItem extends StatelessWidget {
  final Events events;
  const EventItem({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? img = events.performers![0].image;
    DateTime dateTime = DateTime.parse(events.datetimeLocal);
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        eventDetailsScreen,
        arguments: events,
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: MyColors.myWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: (img == null)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/placeholder.jpg',
                  ),
                )
              : Hero(
                tag: events.id.toString(),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(img)),
              ),
          title: Text(
            '${events.title}',
            style: const TextStyle(color: MyColors.myGrey, fontSize: 20),
            overflow: TextOverflow.ellipsis,
            //maxLines: 1,
            textAlign: TextAlign.left,
          ),
          subtitle: Text('${events.venue?.displayLocation} \n$formattedDate'),
          trailing: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}
