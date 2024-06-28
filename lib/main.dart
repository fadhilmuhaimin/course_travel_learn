import 'package:course_travel/common/app_route.dart';
import 'package:course_travel/features/destination/presentation/bloc/all_destination/all_destination_bloc.dart';
import 'package:course_travel/features/destination/presentation/bloc/search_destination/search_destination_bloc.dart';
import 'package:course_travel/features/destination/presentation/bloc/top_destination/top_destination_bloc.dart';
import 'package:course_travel/features/destination/presentation/cubit/dashboad_cubit.dart';
import 'package:course_travel/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashboadCubit()),
        BlocProvider(create: (_) => locator<AllDestinationBloc>()),
        BlocProvider(create: (_) => locator<SearchDestinationBloc>()),
        BlocProvider(create: (_) => locator<TopDestinationBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: AppRoute.dashboard,
        onGenerateRoute: AppRoute.onGenerateRoute,
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

