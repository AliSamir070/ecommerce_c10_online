// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/dao/datasource_contract/auth_datasource/auth_datasource.dart'
    as _i4;
import '../../data/dao/datasource_contract/brands_datasource/BrandsDataSource.dart'
    as _i8;
import '../../data/dao/datasource_contract/cart_datasource/CartDataSource.dart'
    as _i12;
import '../../data/dao/datasource_contract/categories_datasource/CategoriesDataSource.dart'
    as _i16;
import '../../data/dao/datasource_contract/products_datasource/productsDataSource.dart'
    as _i23;
import '../../data/dao/datasource_contract/subcategories_datasource/SubcategoriesDataSource.dart'
    as _i30;
import '../../data/dao/datasource_impl/auth_datasource_impl/AuthDatasourceImpl.dart'
    as _i5;
import '../../data/dao/datasource_impl/brands_datasource_impl/BrandsDatasourceImpl.dart'
    as _i9;
import '../../data/dao/datasource_impl/cart_datasource_impl/CartDataSourceImpl.dart'
    as _i13;
import '../../data/dao/datasource_impl/categories_datasource_impl/CategoriesDataSourceImpl.dart'
    as _i17;
import '../../data/dao/datasource_impl/products_datasource_impl/ProductsDatasourceImpl.dart'
    as _i24;
import '../../data/dao/datasource_impl/subcategories_datasource_impl/SubCategoriesDataSourceImpl.dart'
    as _i31;
import '../../data/repository_impl/auth_repo_impl/AuthRepoImpl.dart' as _i7;
import '../../data/repository_impl/brands_repo_impl/BrandsRepoImpl.dart'
    as _i11;
import '../../data/repository_impl/cart_repo_impl/CartRepoImpl.dart' as _i15;
import '../../data/repository_impl/categories_repo_impl/CategoriesRepoImpl.dart'
    as _i19;
import '../../data/repository_impl/products_repo_impl/ProductsRepoImpl.dart'
    as _i26;
import '../../data/repository_impl/subcategories_repo_impl/SubCategoriesRepoImpl.dart'
    as _i38;
import '../../domain/repository_contract/auth_repo/AuthRepo.dart' as _i6;
import '../../domain/repository_contract/brands_repo/BrandsRepo.dart' as _i10;
import '../../domain/repository_contract/cart_repo/CartRepo.dart' as _i14;
import '../../domain/repository_contract/categories_repo/CategoriesRepo.dart'
    as _i18;
import '../../domain/repository_contract/products_repo/ProductsRepo.dart'
    as _i25;
import '../../domain/repository_contract/subcategories_repo/SubCategorieRepo.dart'
    as _i37;
import '../../domain/usecases/add_to_cart_usecase.dart' as _i32;
import '../../domain/usecases/get_brands_use_case.dart' as _i20;
import '../../domain/usecases/get_cart_usecase.dart' as _i21;
import '../../domain/usecases/get_categories_use_case.dart' as _i22;
import '../../domain/usecases/get_most_selling_products_use_case.dart' as _i34;
import '../../domain/usecases/get_subcategories_of_specific_category.dart'
    as _i39;
import '../../domain/usecases/signin_usecase.dart' as _i27;
import '../../domain/usecases/sugnup_usecase.dart' as _i28;
import '../../presentation/cart/view_model/cart_view_model_cubit.dart' as _i33;
import '../../presentation/home/tabs/categories_tab/viewmodel/CategoriesTabViewModel.dart'
    as _i40;
import '../../presentation/home/tabs/home_tab/viewmodel/home_tab_viewModel.dart'
    as _i35;
import '../../presentation/login/view_model/LoginViewModel.dart' as _i36;
import '../../presentation/register/view_model/SignUpVIewModel.dart' as _i29;
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
    gh.factory<_i4.AuthDataSource>(
        () => _i5.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthRepo>(() => _i7.AuthRepoImpl(gh<_i4.AuthDataSource>()));
    gh.factory<_i8.BrandDataSource>(
        () => _i9.BrandsDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.BrandsRepo>(
        () => _i11.BrandsRepoImpl(gh<_i8.BrandDataSource>()));
    gh.factory<_i12.CartDataSource>(
        () => _i13.CartDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.CartRepo>(
        () => _i15.CartRepoImpl(gh<_i12.CartDataSource>()));
    gh.factory<_i16.CategoriesDatasource>(
        () => _i17.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i18.CategoriesRepo>(
        () => _i19.CategoriesRepoImpl(gh<_i16.CategoriesDatasource>()));
    gh.factory<_i20.GetBrandsUseCase>(
        () => _i20.GetBrandsUseCase(gh<_i10.BrandsRepo>()));
    gh.factory<_i21.GetCartUseCase>(
        () => _i21.GetCartUseCase(gh<_i14.CartRepo>()));
    gh.factory<_i22.GetCategoriesUseCase>(
        () => _i22.GetCategoriesUseCase(gh<_i18.CategoriesRepo>()));
    gh.factory<_i23.ProductsDataSource>(
        () => _i24.ProductsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i25.ProductsRepo>(
        () => _i26.ProductsRepoImpl(gh<_i23.ProductsDataSource>()));
    gh.factory<_i27.SignInUseCase>(
        () => _i27.SignInUseCase(gh<_i6.AuthRepo>()));
    gh.factory<_i28.SignUpUseCase>(
        () => _i28.SignUpUseCase(gh<_i6.AuthRepo>()));
    gh.factory<_i29.SignUpViewModel>(
        () => _i29.SignUpViewModel(gh<_i28.SignUpUseCase>()));
    gh.factory<_i30.SubcategoriesDataSource>(
        () => _i31.SubCategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i32.AddToCartUseCase>(
        () => _i32.AddToCartUseCase(gh<_i14.CartRepo>()));
    gh.factory<_i33.CartViewModel>(
        () => _i33.CartViewModel(gh<_i21.GetCartUseCase>()));
    gh.factory<_i34.GetMostSellingProductsUseCase>(
        () => _i34.GetMostSellingProductsUseCase(gh<_i25.ProductsRepo>()));
    gh.factory<_i35.HomeTabViewModel>(() => _i35.HomeTabViewModel(
          gh<_i32.AddToCartUseCase>(),
          gh<_i22.GetCategoriesUseCase>(),
          gh<_i20.GetBrandsUseCase>(),
          gh<_i34.GetMostSellingProductsUseCase>(),
        ));
    gh.factory<_i36.LoginViewModel>(
        () => _i36.LoginViewModel(gh<_i27.SignInUseCase>()));
    gh.factory<_i37.SubCategoriesRepo>(
        () => _i38.SubCategoriesRepoImpl(gh<_i30.SubcategoriesDataSource>()));
    gh.factory<_i39.GetSubcategoriesOfSpecificCategoryUseCase>(() =>
        _i39.GetSubcategoriesOfSpecificCategoryUseCase(
            gh<_i37.SubCategoriesRepo>()));
    gh.factory<_i40.CategoriesTabViewModel>(() => _i40.CategoriesTabViewModel(
          gh<_i22.GetCategoriesUseCase>(),
          gh<_i39.GetSubcategoriesOfSpecificCategoryUseCase>(),
        ));
    return this;
  }
}
