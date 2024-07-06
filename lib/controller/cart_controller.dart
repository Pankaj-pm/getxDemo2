import 'package:get/get.dart';
import 'package:getx_counter_2/model/product_model.dart';

class CartController extends GetxController {
  RxList<ProductModel> cartList = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    var arguments = Get.arguments;
    print(" arguments ==>${arguments}");
    print("onInit ");
  }

  @override
  void onReady() {
    print("onReady");
    var arguments = Get.arguments;
    print(" arguments ==>${arguments}");
    super.onReady();
  }

  void getData() {
    var arguments = Get.arguments;
    print(" arguments ==>${arguments}");
  }
}
