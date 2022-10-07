import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../view/courses_detail_view.dart';

class CoursesDetailController extends GetxController {
  CoursesDetailView? view;
  Rxn<String> selectedPayment = Rxn<String>();

  List paymentList = ['Debit', 'OVO', 'Gopay', 'Dana'];

  doBuy() async {
    await FirebaseFirestore.instance.collection("orders").add({
      "courses": view!.item,
      "payment_method": selectedPayment.value,
    });

    Get.back();
  }
}
