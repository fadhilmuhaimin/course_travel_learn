// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:course_travel/features/destination/presentation/bloc/top_destination/top_destination_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final topDestinationController = PageController();
  refresh() {
    context.read<TopDestinationBloc>().add(OnTopDestinationEvent());
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),
        header(),
        SizedBox(
          height: 30,
        ),
        search(),
        const SizedBox(
          height: 30,
        ),
        categories(),
        SizedBox(
          height: 30,
        ),
        topDestination(),
        SizedBox(
          height: 30,
        ),
        allDestination()
      ],
    );
  }

  header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).primaryColor)),
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Hi, Dre',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Spacer(),
          Badge(
            backgroundColor: Colors.red,
            alignment: Alignment(0.6, -0.6),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
    );
  }

  search() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(30)),
          width: 1,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(left: 24),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
                hintText: 'Search Destination here',
                hintStyle:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(width: 10,),
          IconButton.filledTonal(
            onPressed: () {},
            icon: Icon(Icons.search, size: 24),
          )
        ],
      ),
    );
  }

  categories() {
    List list = [
      'Beach',
      'Lake',
      'Mountain',
      'Forest',
      'City',
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(list.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 30 : 10,
              right: index == list.length-1 ? 30 : 10,
              bottom: 10,
              top: 4
            ),
            child: Material(
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6,horizontal: 16),
                child: Text(
                  list[index],
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  topDestination() {
    return SizedBox(
      height: 10,
    );
  }

  allDestination() {
    return SizedBox(
      height: 10,
    );
  }
}
