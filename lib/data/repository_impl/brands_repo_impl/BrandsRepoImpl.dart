import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_impl/brands_datasource_impl/BrandsDatasourceImpl.dart';

import 'package:ecommerce_c10_online/domain/entities/brand_entity/BrandEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository_contract/brands_repo/BrandsRepo.dart';
import '../../dao/datasource_contract/brands_datasource/BrandsDataSource.dart';
@Injectable(as: BrandsRepo)
class BrandsRepoImpl extends BrandsRepo{
  BrandDataSource apiDataSource;
  @factoryMethod
  BrandsRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<BrandEntity>, String>> getBrands() async{
    var result = await apiDataSource.getBrands();
    return result.fold((brandsResponse){
      var brandsModelList = brandsResponse.data??[];
      var brandsEntityList = brandsModelList.map((brandModel) => brandModel.toBrandEntity()).toList();
      return Left(brandsEntityList);
    }, (error){
      return Right(error);
    });
  }

}