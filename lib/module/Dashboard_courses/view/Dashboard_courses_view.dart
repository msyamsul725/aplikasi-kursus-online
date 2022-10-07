import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';

import 'package:get/get.dart';

import '../../courses_detail/view/courses_detail_view.dart';
import '../controller/Dashboard_courses_controller.dart';

class DashboardCoursesView extends StatelessWidget {
  const DashboardCoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardCoursesController>(
      init: DashboardCoursesController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: const Color(0xff1B9CFC),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Color(0xff1B9CFC),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                      ),
                      child: SafeArea(
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "What courses are you ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                    Text(
                                      " looking for?",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: 370,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.grey[400]!,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.search),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        initialValue: null,
                                        decoration:
                                            const InputDecoration.collapsed(
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          hintText: "Search",
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.sort,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            padding: const EdgeInsets.all(5.5),
                            child: Image.asset(
                              "assets/icon/fire.png",
                              width: 64.0,
                              height: 64.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Text(
                            "Trending",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300.0,
                      decoration: const BoxDecoration(),
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
                          return SizedBox(
                            height: 140.0,
                            child: ListView.builder(
                              itemCount: data.docs.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var item = (data.docs[index].data() as Map);
                                item["id"] = data.docs[index].id;
                                return Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      width: 300.0,
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () => Get.to(
                                              CoursesDetailView(item: item),
                                            ),
                                            child: Container(
                                              height: 200.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    item["photo_banner"],
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Container(
                                                      height: 36,
                                                      width: 100,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(12.0),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Text(
                                                          "${item["videos"]} Videos",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 100.0,
                                            decoration: const BoxDecoration(
                                              color: Colors.white70,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(12.0),
                                                bottomRight:
                                                    Radius.circular(12.0),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                      14.0),
                                                  height: 50.0,
                                                  child: Text(
                                                    item["courses_name"],
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  height: 50.0,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          8.0),
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 18.0,
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                  item[
                                                                      "photo_instructor"],
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              item[
                                                                  "instructor_name"],
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black54),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        "\$${item["price"]}",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: 36.0,
                            width: 36.0,
                            padding: const EdgeInsets.all(5.5),
                            child: Image.asset(
                              "assets/icon/love.png",
                              width: 64.0,
                              height: 64.0,
                            ),
                          ),
                          const Text(
                            "New Releassed",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
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
                        return SizedBox(
                          height: 100,
                          child: ListView.builder(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            itemCount: data.docs.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              var item = (data.docs[index].data() as Map);
                              item["id"] = data.docs[index].id;
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () => Get.to(
                                      CoursesDetailView(item: item),
                                    ),
                                    child: Container(
                                      height: 100,
                                      width: 100.0,
                                      margin:
                                          const EdgeInsets.only(bottom: 16.0),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            item["photo_banner"],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12.0),
                                          bottomLeft: Radius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100.0,
                                    width: 270.0,
                                    margin: const EdgeInsets.only(bottom: 16.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(14.0),
                                          height: 50.0,
                                          child: Text(
                                            item["courses_name"],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(12.0),
                                          height: 50.0,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  item["instructor_name"],
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                              Text(
                                                "${item["videos"]} Videos",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 200.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 18.0),
                        width: 100.0,
                        height: 150.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage("assets/icon/mobile.png"),
                                backgroundColor: Color(0xff1B9CFC),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "Tech",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 18.0),
                        width: 100.0,
                        height: 150.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage("assets/icon/mono.png"),
                                backgroundColor: Color(0xff1B9CFC),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "Language",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 150.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage("assets/icon/chef.png"),
                                backgroundColor: Color(0xff1B9CFC),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              "Cooking",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      )
                    ],
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
