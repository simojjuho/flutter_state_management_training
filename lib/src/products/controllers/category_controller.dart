import 'package:state_training/src/products/domain/core_entities/category.dart';

import '/src/utils/http.dart';

class CategoryController {
  Future<List<Category>> getAll() async {
    var response = await dio.get('/categories');
    final List<dynamic> rawData = response.data;
    final List<Category> categories =
        rawData.map((e) => Category.parseCategory(e)).toList();
    return categories;
  }
}
