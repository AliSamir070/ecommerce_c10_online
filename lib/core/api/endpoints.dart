class Endpoints{
  static const String categoriesEndpoint = "/api/v1/categories";
  static const String brandsEndpoint = "/api/v1/brands";
  static const String productsEndpoint = "/api/v1/products";
  static const String signupEndpoint = "/api/v1/auth/signup";
  static const String signInEndpoint = "/api/v1/auth/signin";
  static const String cartEndpoint = "/api/v1/cart/";
  static String subCategoriesOfCategoryEndpoint(String categoryId) => "/api/v1/categories/$categoryId/subcategories";
}