import 'package:course_travel/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../entities/destination_entitiy.dart';

abstract class DestinationRepository {
  Future<Either<Failure, List<DestinationEntity>>> all();
  Future<Either<Failure, List<DestinationEntity>>> top();
  Future<Either<Failure, List<DestinationEntity>>> search(String query);
}
