import 'package:digital14_task/business_logic/cubit/events_cubit.dart';
import 'package:digital14_task/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/events.dart';
import '../widgets/event_item.dart';

class EventsScreen extends StatefulWidget {
  //late List<String> favoriteDataList;
  EventsScreen({Key? key,}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  late List<Events> allEvents;
  late List<Events> searchedForEvents;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  // Start Search functions
  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myWhite,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myWhite, fontSize: 18),
      ),
      style: const TextStyle(color: MyColors.myWhite, fontSize: 18),
      onChanged: (searchedEvent) {
        addSearchedForItemsToSearchedList(searchedEvent);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedEvent) {
    searchedForEvents = allEvents
        .where((event) => event.title!.toLowerCase().startsWith(searchedEvent))
        .toList();
    setState(() {});
  }

  // list of search widget and x
  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: MyColors.myWhite),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: MyColors.myWhite,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Events Digital14',
      style: TextStyle(color: MyColors.myWhite),
    );
  }
  // End Search functions

  @override
  void initState() {
    super.initState();
    // UI ask the Cubit to get the data
    BlocProvider.of<EventsCubit>(context).getAllEventsCubit();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<EventsCubit, EventsState>(
      builder: (_, state) {
        if (state is EventsLoaded) {
          allEvents = (state).events;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndecator();
        }
      },
    );
  }

  Widget showLoadingIndecator() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.myBlue),
    );
  }

  Widget buildLoadedListWidget() {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: _searchTextController.text.isEmpty
          ? allEvents.length
          : searchedForEvents.length,
      itemBuilder: (ctx, index) {
        return EventItem(
          events: _searchTextController.text.isEmpty
              ? allEvents[index]
              : searchedForEvents[index],
        );
        //return EventItem(events: allEvents[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myBlue,
        leading: _isSearching
            ? BackButton(
                color: MyColors.myWhite,
              )
            : Container(),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
