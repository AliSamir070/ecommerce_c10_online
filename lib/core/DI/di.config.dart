// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/dao/datasource_contract/brands_datasource/BrandsDataSource.dart'
    as _i4;
import '../../data/dao/datasource_contract/categories_datasource/CategoriesDataSource.dart'
    as _i8;
import '../../data/dao/datasource_contract/products_datasource/productsDataSource.dart'
    as _i14;
import '../../data/dao/datasource_impl/brands_datasource_impl/BrandsDatasourceImpl.dart'
    as _i5;
import '../../data/dao/datasource_impl/categories_datasource_impl/CategoriesDataSourceImpl.dart'
    as _i9;
import '../../data/dao/datasource_impl/products_datasource_impl/ProductsDatasourceImpl.dart'
    as _i15;
import '../../data/repository_impl/brands_repo_impl/BrandsRepoImpl.dart' as _i7;
import '../../data/repository_impl/categories_repo_impl/CategoriesRepoImpl.dart'
    as _i11;
import '../../data/repository_impl/products_repo_impl/ProductsRepoImpl.dart'
    as _i17;
import '../../domain/repository_contract/brands_repo/BrandsRepo.dart' as _i6;
import '../../domain/repository_contract/categories_repo/CategoriesRepo.dart'
    as _i10;
import '../../domain/repository_contract/products_repo/ProductsRepo.dart'
    as _i16;
import '../../domain/usecases/get_brands_use_case.dart' as _i12;
import '../../domain/usecases/get_categories_use_case.dart' as _i13;
import '../../domain/usecases/get_most_selling_products_use_case.dart' as _i18;
import '../../presentation/home/tabs/home_tab/viewmodel/home_tab_viewModel.dart'
    as _i19;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.BrandDataSource>(
        () => _i5.BrandsDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.BrandsRepo>(
        () => _i7.BrandsRepoImpl(gh<_i4.BrandDataSource>()));
    gh.factory<_i8.CategoriesDatasource>(
        () => _i9.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.CategoriesRepo>(
        () => _i11.CategoriesRepoImpl(gh<_i8.CategoriesDatasource>()));
    gh.factory<_i12.GetBrandsUseCase>(
        () => _i12.GetBrandsUseCase(gh<_i6.BrandsRepo>()));
    gh.factory<_i13.GetCategoriesUseCase>(
        () => _i13.GetCategoriesUseCase(gh<_i10.CategoriesRepo>()));
    gh.factory<_i14.ProductsDataSource>(
        () => _i15.ProductsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i16.ProductsRepo>(
        () => _i17.ProductsRepoImpl(gh<_i14.ProductsDataSource>()));
    gh.factory<_i18.GetMostSellingProductsUseCase>(
        () => _i18.GetMostSellingProductsUseCase(gh<_i16.ProductsRepo>()));
    gh.factory<_i19.HomeTabViewModel>(() => _i19.HomeTabViewModel(
          gh<_i13.GetCategoriesUseCase>(),
          gh<_i12.GetBrandsUseCase>(),
          gh<_i18.GetMostSellingProductsUseCase>(),
        ));
    return this;
  }
}
