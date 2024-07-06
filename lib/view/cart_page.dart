import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter_2/controller/cart_controller.dart';
import 'package:getx_counter_2/model/product_model.dart';

class CartPage extends StatelessWidget {
  CartController controller = Get.put(CartController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            controller.getData();

          }, icon: Icon(Icons.ac_unit))
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.cartList.length,
          itemBuilder: (context, index) {
            ProductModel product = controller.cartList[index];
            return ListTile(
              title: Text(product.name ?? ""),
              subtitle: Text("\$ ${product.price}"),
              trailing: IconButton(
                onPressed: () {
                  controller.cartList.remove(product);
                },
                icon: Icon(Icons.delete),
              ),
            );
          },
        );
      }),
    );
  }
}
