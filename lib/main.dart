import 'package:flutter/material.dart';
import 'package:flutter_todo_v2/controllers/locale_controller.dart';
import 'package:flutter_todo_v2/controllers/theme_controller.dart';
import 'package:flutter_todo_v2/helper/app_page.dart';
import 'package:flutter_todo_v2/helper/themes.dart';
import 'package:flutter_todo_v2/helper/translations.dart';
import 'package:flutter_todo_v2/helper/routes.dart';
import 'package:flutter_todo_v2/models/task.dart';
import 'package:flutter_todo_v2/models/category.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(CategoryAdapter());

  await Hive.openBox<Task>('tasks');
  await Hive.openBox<Category>('categories');
  await Hive.openBox('settings');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    Get.put(LocaleController());

    return GetMaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: Get.find<ThemeController>().themeMode,
      translations: AppTranslations(),
      locale: Get.find<LocaleController>().locale.value,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppRoutes.TASKS,
      getPages: AppPage.page,
    );
  }
}
