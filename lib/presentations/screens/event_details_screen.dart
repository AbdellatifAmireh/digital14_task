import 'package:digital14_task/data/models/events.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/my_colors.dart';

class EventDetailsScreen extends StatefulWidget {
  final Events event;
  //late List<String> favoriteDataList;
  const EventDetailsScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late Color col = Colors.grey;
  late bool addToFav = false;

  List<Widget>? favorateIcon() {
    return [
      InkWell(
        onTap: () {
          setState(() {
            //widget.favoriteDataList.add(widget.event.id.toString());
            if (addToFav) {
              col = Colors.grey;
              addToFav = false;
            } else {
              col = Colors.red;
              addToFav = true;
            }
          });
        },
        child: Icon(Icons.favorite, color: col),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    String? img = widget.event.performers![0].image;
    DateTime dateTime = DateTime.parse(widget.event.datetimeLocal);
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myBlue,
        title: Text('${widget.event.title}'),
        actions: favorateIcon(),
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.event.id.toString(),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  img!,
                  width: double.infinity,
                )),
          ),
          Text(
            '${widget.event.venue?.displayLocation} \n$formattedDate',
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
