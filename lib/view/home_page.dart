import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter_2/controller/home_controller.dart';
import 'package:getx_counter_2/model/counter.dart';
import 'package:getx_counter_2/model/student.dart';
import 'package:getx_counter_2/view/product_page.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Obx(() {
            return Text("Int Value ${controller.counter.value.count}");
          }),
          TextFormField(
            onChanged: (value) {
              var homeController = Get.find<HomeController>();
              homeController.changeStudent(Student(value, Random().nextBool()));

              homeController.name.value = value;

              print("value $value");
            },
          ),
          Center(
            child: GetBuilder(
              init: HomeController(),
              builder: (homeController) {
                return Text(
                  "Count is ${homeController.count}",
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: "1",
                onPressed: () {
                  // count++;

                  controller.counter.value = Counter(controller.counter.value.count + 1);
                  // controller.counter.value.count++;
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  controller.counter.value = Counter(controller.counter.value.count - 1);
                  // count--;
                },
                child: Icon(Icons.remove),
              ),
            ],
          ),
          Center(
            child: GetBuilder(
              init: HomeController(),
              builder: (homeController) {
                return Text(
                  "Welcome ${homeController.name}",
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
          Center(
            child: GetX(
              init: HomeController(),
              builder: (homeController) {
                return Text(
                  "Welcome ${homeController.student.value.name} and you are ${(homeController.student.value.isPass ??
                      false) ? "Pass" : "Fail"}",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Obx(() {
            return AnimatedContainer(
              duration: Duration(seconds: 3),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(color: controller.isDark.value ?Colors.white:Colors.black, shape: BoxShape.circle),
              child: InkWell(
                onTap: () {
                  if (Get.isDarkMode) {
                    Get.changeThemeMode(ThemeMode.light);
                    controller.isDark.value=false;
                  } else {
                    Get.changeThemeMode(ThemeMode.dark);
                    controller.isDark.value=true;
                  }
                },
                child: Icon(controller.isDark.value ? Icons.dark_mode :Icons.light_mode , size: 80, color: controller.isDark.value ?Colors.black:Colors.white),
              ),
            );
          }),
          ElevatedButton(onPressed: () {

            Get.to(()=>ProductPage());

          }, child: Text("Product"))
        ],
      ),
    );
  }

/// Using obx

// int simpleCount = 0;
// RxInt count = 0.obs;
// RxString name = "".obs;
// Rx<Student> student = Student("", false).obs;
// Rx<Counter> counter=Counter().obs;
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(),
//     body: Column(
//       children: [
//         TextFormField(
//           onChanged: (value) {
//             name.value = value;
//             student.value=Student(value, Random().nextBool());
//             print("value $value");
//           },
//         ),
//         Center(
//           child: Obx(() {
//             return Text(
//               "Count is $count",
//               style: TextStyle(fontSize: 50),
//             );
//           }),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             FloatingActionButton(
//               onPressed: () {
//                 count++;
//               },
//               child: Icon(Icons.add),
//             ),
//             FloatingActionButton(
//               onPressed: () {
//                 count--;
//               },
//               child: Icon(Icons.remove),
//             ),
//           ],
//         ),
//         Center(
//           child: Obx(() {
//             return Text(
//               "Welcome $name",
//               style: TextStyle(fontSize: 50),
//             );
//           }),
//         ),
//
//         Center(
//           child: Obx(() {
//             return Text(
//               "Welcome ${student.value.name} and you are ${(student.value.isPass ?? false) ? "Pass" : "Fail"}",
//               style: TextStyle(fontSize: 20),
//             );
//           }),
//         ),
//       ],
//     ),
//   );
// }
}
