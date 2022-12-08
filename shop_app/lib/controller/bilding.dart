import 'package:get/instance_manager.dart';
import 'package:shop_app/controller/product_controller.dart';

class ProductBilding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
