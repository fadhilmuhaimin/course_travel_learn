import 'package:course_travel/features/destination/presentation/cubit/dashboad_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<DashboadCubit>().page,
        bottomNavigationBar: Material(
          elevation: 10,
          child: BlocBuilder<DashboadCubit, int>(
            builder: (context, state) {
              return Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: NavigationBar(
                      selectedIndex: state,
                      onDestinationSelected: (value) {
                        context.read<DashboadCubit>().change(value);
                      },
                      backgroundColor: Colors.white,
                      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                        destinations: context.read<DashboadCubit>().menuDashboard.map((e) {
                  return NavigationDestination(
                    icon: Icon(
                      e[1],
                      color: Colors.grey[500],
                    ),
                    label: e[0],
                    tooltip: e[0],
                    selectedIcon: Icon(
                      e[1],
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }).toList()),
              );
            },
          ),
        ));
  }
}
