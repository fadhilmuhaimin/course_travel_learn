import 'package:course_travel/features/destination/domain/repositories/destination_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/destination_entitiy.dart';

class GetTopDestinationUseCase {
  final DestinationRepository _repository;

  GetTopDestinationUseCase(this._repository);

  Future<Either<Failure, List<DestinationEntity>>> call() {
    return _repository.top();
  }
}
