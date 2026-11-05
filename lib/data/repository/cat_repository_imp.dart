import 'package:cat_app/data/data_source/cat_local_datasource.dart';
import 'package:cat_app/data/data_source/cat_remote_datasource.dart';
import 'package:cat_app/domain/entities/fact_entitity.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';

class CatRepositoryImp extends CatRepository{
  final CatRemoteDatasource catRemoteDatasource;
  final CatLocalDatasource catLocalDatasource;
  CatRepositoryImp({required this.catRemoteDatasource,required this.catLocalDatasource});
  @override
   Future<Either<FactEntitity, String>> getFact() async{
   return catRemoteDatasource.getFact();
  }

  @override
  Future<void> getBreed() {
    // TODO: implement getBreed
    throw UnimplementedError();
  }

  
  
}