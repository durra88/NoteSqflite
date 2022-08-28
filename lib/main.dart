import 'package:flutter/material.dart';
import 'package:flutterfire_codex/screeen/note_screen.dart';
import 'package:flutterfire_codex/translation/translate.dart';
import 'package:get/get.dart';

import 'bindings/all_bindings.dart';
import 'sqlite_helper/sql_helpper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  SqlHelper().init();
  Binding().dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //locale: const Locale('ar', 'AR'),
      fallbackLocale: const Locale('en', 'US'),
      translations: Translate(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 400),
      initialBinding: Binding(),
      title: 'Note ',
      home: NoteScreen(),
    );
  }
}
