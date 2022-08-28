// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterfire_codex/controller/note_controller.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../controller/translation_controller.dart';
import '../model/note_model.dart';
import 'detail_note_screen.dart';

class NoteScreen extends StatelessWidget {
  var translateController = Get.find<TranslationController>();
  var controller = Get.find<NoteController>();
  //var themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    var currentIdex = 0.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text('notes'.tr),
        actions: [
          IconButton(
              onPressed: () {
                bottonSheet();
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Obx(() {
        var note = controller.noteModel;
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: note.length,
            itemBuilder: (context, index) {
              currentIdex.value = index;

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                ),
                height: 150,
                key: ValueKey(note[index].position),
                child: InkWell(
                  onTap: () {
                    Get.to(NoteDetails(
                      index: index,
                      isNew: false,
                      note: controller.noteModel[index],
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          note[index].name ??= "",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                            overflow: TextOverflow.ellipsis,
                            note[index].notes ??= "",
                            style: const TextStyle(
                              fontSize: 20,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                            overflow: TextOverflow.ellipsis,
                            note[index].date ??= "",
                            style: const TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
              () => NoteDetails(
                    isNew: true,
                    note: Note(),
                    index: currentIdex.value,
                  ),
              transition: Transition.zoom,
              curve: Curves.bounceInOut,
              duration: const Duration(milliseconds: 400));
        },
        tooltip: 'add',
        child: const Icon(Icons.add),
      ),
    );
  }

  bottonSheet() {
    return Get.bottomSheet(
        //   barrierColor: Colors.blueAccent,
        backgroundColor: const Color.fromRGBO(94, 3, 71, 1),
        isDismissible: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        Obx(() => Wrap(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.monochrome_photos,
                    color: Colors.amber,
                  ),
                  title: Text(
                    Get.isDarkMode ? "darkMode".tr : "lightMode".tr,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                    );
                  },
                ),
                ListTile(
                  onTap: () {
                    if (translateController.isArabic == true) {
                      translateController.changeLanguage('en', 'EN');
                      //translateController.isArabic.value == false;
                    }
                    translateController.changeLanguage('ar', 'AR');
                  },
                  leading: const Icon(Icons.translate, color: Colors.blue),
                  title: Text(
                      translateController.isArabic == true
                          ? "arabic".tr
                          : "english".tr,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            )));
  }
}
