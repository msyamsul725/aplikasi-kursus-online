import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../courses_form/view/courses_form_view.dart';
import '../controller/courses_list_controller.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesListController>(
      init: CoursesListController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Course List"),
            backgroundColor: const Color(0xff1B9CFC),
            actions: [
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1B9CFC),
                ),
                onPressed: () => Get.to(const CoursesFormView()),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //body
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (snapshot.data == null) return Container();
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No Data");
                      }
                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          var item = (data.docs[index].data() as Map);
                          item["id"] = data.docs[index].id;
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: NetworkImage(
                                  item["photo_banner"],
                                ),
                              ),
                              title: Text(item["courses_name"]),
                              subtitle: Text("\$${item["price"]}"),
                              trailing: IconButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("courses")
                                      .doc(item["id"])
                                      .delete();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          );
                        },
                      );
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
