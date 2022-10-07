import 'package:flutter/material.dart';

import '../../../Moodle_Services/service.dart';
import '../../../model/courses.dart';

class MoodleView extends StatefulWidget {
  const MoodleView({Key? key}) : super(key: key);

  @override
  State<MoodleView> createState() => _MoodleViewState();
}

class _MoodleViewState extends State<MoodleView> {
  List<Courses> data = [];
  ServiceClass info = ServiceClass();

  getData() async {
    data = await info.getData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moodle"),
        backgroundColor: const Color(0xff1B9CFC),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24.0,
            ),
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Moodle Course",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 650,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 160.0,
                    child: SingleChildScrollView(
                      controller: ScrollController(),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 24.0),
                            height: 150.0,
                            child: Row(
                              children: [
                                Container(
                                  width: 160.0,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12.0),
                                      bottomLeft: Radius.circular(12.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${data[index].courseimage}",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 150.0,
                                  width: 215.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text("${data[index].fullname}"),
                                        subtitle: Text(
                                          "${data[index].coursecategory}",
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                        ),
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
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: data.length),
          ),
        ],
      ),
    );
  }
}
