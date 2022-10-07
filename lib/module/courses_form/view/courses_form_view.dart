import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/shared/widget/image_picker/image_picker.dart';
import 'package:flutter_hyper_ui/shared/widget/radio/radio.dart';
import 'package:flutter_hyper_ui/shared/widget/radio_new/radio_with_custom.options.dart';
import 'package:flutter_hyper_ui/shared/widget/rating/rating.dart';
import 'package:flutter_hyper_ui/shared/widget/textfield/textarea.dart';
import 'package:flutter_hyper_ui/shared/widget/textfield/textfield.dart';
import '../controller/courses_form_controller.dart';

import 'package:get/get.dart';

class CoursesFormView extends StatelessWidget {
  const CoursesFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesFormController>(
      init: CoursesFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("CoursesForm"),
            backgroundColor: const Color(0xff1B9CFC),
            actions: [
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1B9CFC),
                ),
                onPressed: () => controller.doSave(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //body
                  const ExTextField(
                    id: "instructor_name",
                    label: "Instructor Name",
                  ),
                  const ExImagePicker(
                    id: "photo_instructor",
                    label: "Photo Instructor",
                  ),
                  const ExTextField(
                    id: "courses_name",
                    label: "Courses Name",
                  ),
                  const ExImagePicker(
                    id: "photo_banner",
                    label: "Photo Banner",
                  ),
                  const ExRadio(
                    id: "courses_theme",
                    label: "Courses Theme",
                    items: [
                      {
                        "label": "Tech",
                        "value": "tech",
                      },
                      {
                        "label": "Language",
                        "value": "languange",
                      },
                      {
                        "label": "Cooking",
                        "value": "cooking",
                      },
                    ],
                  ),
                  const ExTextField(
                    id: "price",
                    label: "Price",
                    keyboardType: TextInputType.number,
                  ),
                  Container(
                    child: Row(
                      children: const [
                        Expanded(
                          child: ExRating(
                            id: "rating",
                            label: "Rate",
                          ),
                        ),
                        Expanded(
                          child: ExTextField(
                            id: "videos",
                            label: "Qty Video",
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ExTextArea(id: "description", label: "Description"),
                  const ExRadioWithCustomOptions(
                    id: "de",
                    label: "Deskripsi",
                    items: [
                      {
                        "label": "Intruduction",
                        "value": "intruduction",
                      }
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
