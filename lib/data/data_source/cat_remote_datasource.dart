import 'package:cat_app/core/database/api/api_consts.dart';
import 'package:cat_app/core/database/api/dio_servise.dart';
import 'package:cat_app/core/error/server_exciption.dart';
import 'package:cat_app/data/model/fact_model.dart';
import 'package:cat_app/domain/entities/fact_entitity.dart';
import 'package:dartz/dartz.dart';

abstract class CatRemoteDatasource {
  Future<Either<FactEntitity, String>> getFact();
  Future<void> getBreeds();
}

class CatRemoteDatasourceImpl implements CatRemoteDatasource {
  final DioServise dioServise;
  CatRemoteDatasourceImpl(this.dioServise);
  @override
  Future<void> getBreeds() {
    // TODO: implement getBreeds
    throw UnimplementedError();
  }

  @override
  Future<Either<FactEntitity, String>> getFact() async {
    //get data from api
   try{
     var res = await dioServise.get(path: ApiConsts.factsEndpoint);
    FactModel data = FactModel.fromJson(res as Map<String, dynamic>);

    return left(data);
   }on ServerExciption catch (e) {
    return right(e.message); 
    } catch (e) {
          return right(e.toString()); 

    }
  }
}
