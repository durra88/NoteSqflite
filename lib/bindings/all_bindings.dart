import 'package:get/get.dart';

import '../controller/note_controller.dart';
import '../controller/translation_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteController());
    Get.lazyPut(() => TranslationController());
  }
}
