// ignore_for_file: prefer_const_constructors

import 'package:course_travel/features/destination/presentation/bloc/top_destination/top_destination_bloc.dart';
import 'package:flutter/material.dart';
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
        border: Border.all(
          color: Colors.grey[300]!
        ),
        borderRadius: BorderRadius.circular(30)
      ),
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(children: [
        TextField(
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            hintText: 'Search Destination here'
          ),
        )
      ],),
    );
  }

  categories() {
    return SizedBox(
      height: 10,
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
