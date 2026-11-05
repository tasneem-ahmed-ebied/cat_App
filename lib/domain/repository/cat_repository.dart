import 'package:cat_app/domain/entities/fact_entitity.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  const CatRepository();
  Future<Either<FactEntitity, String>> getFact();
  Future<void> getBreed();
}