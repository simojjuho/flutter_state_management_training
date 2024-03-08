import 'package:state_training/src/products/controllers/category_controller.dart';
import 'package:state_training/src/products/domain/core_entities/category.dart';

class CategoryService {
  final controller = CategoryController();

  Future<List<Category>> getAll() async {
    return await controller.getAll();
  }
}
