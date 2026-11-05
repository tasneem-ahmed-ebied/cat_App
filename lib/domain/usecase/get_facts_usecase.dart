import 'package:cat_app/domain/entities/fact_entitity.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetFactsUsecase {
  final CatRepository catRepository;
  const GetFactsUsecase({required this.catRepository});
  Future<Either<FactEntitity, String>> execute() {
    return catRepository.getFact();
  }
}
