import 'dart:async';
import 'dart:io';

import 'package:course_travel/core/error/exceptions.dart';
import 'package:course_travel/core/error/failures.dart';
import 'package:course_travel/core/platform/network_info.dart';
import 'package:course_travel/features/destination/data/datasources/destination_local_data_source.dart';
import 'package:course_travel/features/destination/data/datasources/destination_remota_data_source.dart';
import 'package:course_travel/features/destination/domain/entities/destination_entitiy.dart';
import 'package:course_travel/features/destination/domain/repositories/destination_repository.dart';
import 'package:dartz/dartz.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final NetworkInfo networkInfo;
  final DestinationLocalDataSource destinationLocalDataSource;
  final DestinationRemoteDataSource destinationRemoteDataSource;

  DestinationRepositoryImpl({required this.networkInfo, required this.destinationLocalDataSource, required this.destinationRemoteDataSource});


  @override
  Future<Either<Failure, List<DestinationEntity>>> all() async {
    bool online = await networkInfo.isConnected();
    if (online) {
      try {
        final result = await destinationRemoteDataSource.all();
        await destinationLocalDataSource.cacheAll(result);
        return Right(result.map((e) => e.toEntity).toList());
      } on TimeoutException {
        return const Left(TimeoutFailure('Timeout. No Response'));
      } on NotFoundException {
        return const Left(NotFoundFailure('Data Not Found'));
      } on ServerException {
        return const Left(ServerFailure('Server Error'));
      }
    }else{
      try{
        final result = await destinationLocalDataSource.getAll();
        return Right(result.map((e) => e.toEntity).toList());
      }on CachedException {
        return Left(const CachedFailure('Data is not present'));
      }

    }
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> search(String query) async {
    try {
        final result = await destinationRemoteDataSource.search(query);
        await destinationLocalDataSource.cacheAll(result);
        return Right(result.map((e) => e.toEntity).toList());
      } on TimeoutException {
        return const Left(TimeoutFailure('Timeout. No Response'));
      } on NotFoundException {
        return const Left(NotFoundFailure('Data Not Found'));
      } on ServerException {
        return const Left(ServerFailure('Server Error'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed connect to the Network'));
      }
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> top() async {
    try {
        final result = await destinationRemoteDataSource.top();
        await destinationLocalDataSource.cacheAll(result);
        return Right(result.map((e) => e.toEntity).toList());
      } on TimeoutException {
        return const Left(TimeoutFailure('Timeout. No Response'));
      } on NotFoundException {
        return const Left(NotFoundFailure('Data Not Found'));
      } on ServerException {
        return const Left(ServerFailure('Server Error'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed connect to the Network'));
      }
  }
}
