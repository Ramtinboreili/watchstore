import 'package:watchstore/data/Model/product.dart';
import 'package:watchstore/data/src/product_data_src.dart';

abstract class IProductRepo {
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}

class ProductRepo implements IProductRepo {
  final IProductDataSrc _iProductDataSrc;

  ProductRepo(this._iProductDataSrc);

  @override
  Future<List<Product>> getAllByBrand(int id) =>
      _iProductDataSrc.getAllByBrand(id);

  @override
  Future<List<Product>> getAllByCategory(int id) =>
      _iProductDataSrc.getAllByCategory(id);

  @override
  Future<List<Product>> getSorted(String routeParam) =>
      _iProductDataSrc.getSorted(routeParam);

  @override
  Future<List<Product>> searchProducts(String searchKey) =>
      _iProductDataSrc.searchProducts(searchKey);
}
