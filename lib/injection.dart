import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:course_travel/core/platform/network_info.dart';
import 'package:course_travel/features/destination/data/datasources/destination_local_data_source.dart';
import 'package:course_travel/features/destination/data/datasources/destination_remota_data_source.dart';
import 'package:course_travel/features/destination/data/repositories/destination_repositories.dart';
import 'package:course_travel/features/destination/domain/repositories/destination_repository.dart';
import 'package:course_travel/features/destination/domain/usecases/get_all_destination_usecase.dart';
import 'package:course_travel/features/destination/domain/usecases/get_top_destination_usecase.dart';
import 'package:course_travel/features/destination/domain/usecases/search_destination_usecase.dart';
import 'package:course_travel/features/destination/presentation/bloc/all_destination/all_destination_bloc.dart';
import 'package:course_travel/features/destination/presentation/bloc/search_destination/search_destination_bloc.dart';
import 'package:course_travel/features/destination/presentation/bloc/top_destination/top_destination_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

Future<void> initLocator() async{
  //bloc
  locator.registerFactory(() => AllDestinationBloc(locator()));
  locator.registerFactory(() => SearchDestinationBloc(locator()));
  locator.registerFactory(() => TopDestinationBloc(locator()));

  //usecase
  locator.registerLazySingleton(()=> GetAllDestinationUseCase(locator()));
  locator.registerLazySingleton(()=> SearchDestinationUseCase(locator()));
  locator.registerLazySingleton(()=> GetTopDestinationUseCase(locator()));

  //repository
  locator.registerLazySingleton<DestinationRepository>(()=> DestinationRepositoryImpl(networkInfo: locator(), destinationLocalDataSource: locator(), destinationRemoteDataSource: locator()));


  //dataSource
  locator.registerLazySingleton<DestinationLocalDataSource>(() => DestinationLocalDataSourceImpl(locator()));
  locator.registerLazySingleton<DestinationRemoteDataSource>(() => DestinationRemoteDataSourceImpl(locator()));

  //platform
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  //external
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => pref);
  locator.registerLazySingleton(() => http.Client);
  locator.registerLazySingleton(() => Connectivity());
}