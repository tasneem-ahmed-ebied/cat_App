import 'package:cat_app/core/database/api/dio_servise.dart';
import 'package:cat_app/data/data_source/cat_local_datasource.dart';
import 'package:cat_app/data/data_source/cat_remote_datasource.dart';
import 'package:cat_app/data/repository/cat_repository_imp.dart';
import 'package:cat_app/domain/entities/fact_entitity.dart';
import 'package:cat_app/domain/usecase/get_facts_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async {
            Dio dio = Dio();
            DioServise dioServise = DioServise(dio);
            CatLocalDatasource catLocalDatasource = CatLocalDatasourceImpl();
            CatRemoteDatasource catRemoteDatasource = CatRemoteDatasourceImpl(dioServise);
            CatRepositoryImp catRepositoryImp = CatRepositoryImp(catRemoteDatasource: catRemoteDatasource, catLocalDatasource: catLocalDatasource);
            GetFactsUsecase getFactsUsecase = GetFactsUsecase(catRepository: catRepositoryImp);
            Either<FactEntitity, String> data = await getFactsUsecase.execute();
            data.fold(
              ( FactEntitity l) {
              print(1);
            }, (String r) {
              print(r);
            },);
          },
          child: const Text('Click')
        )
      ),  
    );
  }
}