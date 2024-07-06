import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_counter_2/controller/cart_controller.dart';
import 'package:getx_counter_2/controller/product_controller.dart';
import 'package:getx_counter_2/model/product_model.dart';
import 'package:getx_counter_2/view/cart_page.dart';

class ProductPage extends StatelessWidget {
  ProductController controller = Get.put(ProductController());
  CartController cartController = Get.put(CartController());

  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Badge(
            label: Obx(() {
              return Text("${cartController.cartList.length}");
            }),
            offset: Offset(-5, 5),
            child: IconButton(onPressed: () {
              Get.to(()=>CartPage(),arguments: "Hello all");
            }, icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            onFieldSubmitted: (value) {
              controller.productList.add(
                ProductModel(value, Random().nextInt(1000).toDouble(), 1),
              );
            },
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  ProductModel product = controller.productList[index];
                  return ListTile(
                    title: Text(product.name ?? ""),
                    subtitle: Text("\$ ${product.price}"),
                    trailing: IconButton(
                      onPressed: () {
                        cartController.cartList.add(product);
                      },
                      icon: Icon(Icons.add_shopping_cart),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
