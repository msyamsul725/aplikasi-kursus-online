import 'package:flutter/material.dart';
import '../controller/courses_detail_controller.dart';

import 'package:get/get.dart';

class CoursesDetailView extends StatelessWidget {
  final Map item;
  const CoursesDetailView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailController>(
      init: CoursesDetailController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(
              right: 20.0,
            ),
            height: 90.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "\$${item["price"]}",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 80.0,
                  ),
                  height: 50,
                  width: 160.0,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.attach_money,
                    ),
                    label: const Text("Buy Course"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1B9CFC),
                    ),
                    onPressed: () => controller.doBuy(),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 340.0,
                    top: 40.0,
                  ),
                  height: 80.0,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 6.0,
                  ),
                  width: 360.0,
                  height: 240.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item["photo_banner"]),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        right: 24.0,
                      ),
                      width: 300.0,
                      child: Text(
                        item["courses_name"],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 204, 208, 211),
                      child: Icon(
                        Icons.heart_broken,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24.0),
                  height: 40.0,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 80.0,
                        width: 80.0,
                        child: Text(item["instructor_name"]),
                      ),
                      SizedBox(
                        height: 80.0,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            "+Follow",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Category",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              item["courses_theme"],
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Reviews",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star),
                                Text(
                                  "${item["rating"]}",
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                              "Comment",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "3,200",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Description",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 100.0,
                  width: 370.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[900]!,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  height: 28,
                  child: ListView.builder(
                    itemCount: controller.paymentList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = controller.paymentList[index];
                      return Obx(() {
                        return InkWell(
                          onTap: () => controller.selectedPayment.value = data,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xff1B9CFC),
                              borderRadius: BorderRadius.circular(4),
                              border: (controller.selectedPayment.value == null)
                                  ? null
                                  : (controller.selectedPayment.value!
                                          .contains(data))
                                      ? Border.all(
                                          width: 2,
                                          color: const Color(0xfffe5524),
                                        )
                                      : null,
                            ),
                            child: Center(
                              child: Text(
                                data,
                                style: TextStyle(
                                  color:
                                      (controller.selectedPayment.value == null)
                                          ? Colors.white
                                          : (controller.selectedPayment.value!
                                                  .contains(data))
                                              ? const Color(0xfffe5524)
                                              : Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
