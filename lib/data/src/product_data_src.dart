import 'package:dio/dio.dart';
import 'package:watchstore/data/Model/product.dart';
import 'package:watchstore/data/costant.dart';
import 'package:watchstore/utils/respons_validator.dart';

abstract class IProductDataSrc {
  // Future<ProductDetailes> getProductDetailes(int id);
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}

class ProductRemoteDataSrc implements IProductDataSrc {
  final Dio httpClient;

  ProductRemoteDataSrc(this.httpClient);

  @override
  Future<List<Product>> getAllByBrand(int id) async {
    List<Product> products = <Product>[];

    final response =
        await httpClient.get(Endpoints.productsByBrand + id.toString());

    HTTPResponseValidator.isValidStatusCode(response.statusCode!);
    for (var elemnt in (response.data['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }
    return products;
  }

  @override
  Future<List<Product>> getAllByCategory(int id) async {
    List<Product> products = <Product>[];

    final response =
        await httpClient.get(Endpoints.productsByCategory + id.toString());

    HTTPResponseValidator.isValidStatusCode(response.statusCode!);
    for (var elemnt in (response.data['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }
    return products;
  }

  @override
  Future<List<Product>> getSorted(String routeParam) async {
    List<Product> products = <Product>[];

    final response = await httpClient.get(Endpoints.baseUrl + routeParam);

    HTTPResponseValidator.isValidStatusCode(response.statusCode!);
    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }
    return products;
  }

  @override
  Future<List<Product>> searchProducts(String searchKey) async {
    List<Product> products = <Product>[];

    final response = await httpClient.get(Endpoints.baseUrl + searchKey);

    HTTPResponseValidator.isValidStatusCode(response.statusCode!);
    for (var elemnt in (response.data['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }
    return products;
  }
}
