import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/brands_repo/BrandsRepo.dart';
import 'package:injectable/injectable.dart';

import '../entities/brand_entity/BrandEntity.dart';

@injectable
class GetBrandsUseCase{
  BrandsRepo brandsRepo;
  @factoryMethod
  GetBrandsUseCase(this.brandsRepo);

  Future<Either<List<BrandEntity>, String>> call()=>brandsRepo.getBrands();
}