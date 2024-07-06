import 'package:get/get.dart';
import 'package:getx_counter_2/model/counter.dart';
import 'package:getx_counter_2/model/student.dart';

class HomeController extends GetxController {
  int simpleCount = 0;
  RxInt count = 0.obs;
  RxString name = "".obs;
  Rx<Student> student = Student("", false).obs;
  Rx<Counter> counter = Counter(0).obs;
  RxBool isDark=Get.isDarkMode.obs;

  void changeStudent(Student s) {
    student.value = s;
    update();
  }
}
