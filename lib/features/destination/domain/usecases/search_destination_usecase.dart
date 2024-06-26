import 'package:course_travel/features/destination/domain/repositories/destination_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/destination_entity.dart';

class SearchDestinationUseCase {
  final DestinationRepository _repository;

  SearchDestinationUseCase(this._repository);

  Future<Either<Failure, List<DestinationEntity>>> call(
      {required String query}) {
    return _repository.search(query);
  }
}
