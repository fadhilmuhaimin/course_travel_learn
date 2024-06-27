import 'package:course_travel/features/destination/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';

class AppRoute{
  static const dashboard = '/';
  static const detailDestination = '/destination/detail';
  static const searchDestination = '/destination/search';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case dashboard:
        return MaterialPageRoute(builder: (context) => Dashboard(),);
    }
  }
}