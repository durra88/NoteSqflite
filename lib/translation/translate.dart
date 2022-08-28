import 'package:get/get.dart';

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_Us': {
          'note': "Note",
          'notes': "Notes",
          'insertNote': "Insert Note",
          'updateNote': "Edit Note",
          'title': "title",
          'description': "write your note ...",
          'date': "Date",
          'arabic': "Arabic",
          'english': "English",
          'darkMode': "Dark mode",
          'lightMode': "Light mode",
        },
        'ar_AR': {
          'note': "ملحوظة",
          'notes': "الملحوظات",
          'insertNote': "إضافة ملحوظة",
          'updateNote': "تعديل الملحوظة",
          'title': "عنوان",
          'description': "اكتب ملحوظتك هنا",
          'date': "التاريخ",
          'arabic': "عربي",
          'english': "English",
          'darkMode': "وضع ليلي",
          'lightMode': "وضع نهاري",
        }
      };
}
