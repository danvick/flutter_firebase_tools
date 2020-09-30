import 'package:dio_http_cache/dio_http_cache.dart';

import '../models/models.dart';
import '../utils/http_client.dart';

class ProductsService {

  // This method implements HTTP caching with dio_http_cache package
  static Future<List<Product>> getProducts({ignoreCache = false}) async {
    var response = await HttpClient.instance.dio.get(
      'http://192.168.100.104:3000/products',
      options: buildCacheOptions(
        Duration(seconds: 5), // Ignore cached data if older than stated duration
        forceRefresh: ignoreCache, //Ignore local cache if this value is true
      ),
    );
    return response.data.map<Product>((p) => Product.fromJson(p)).toList();
  }
}
