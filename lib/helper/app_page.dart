import 'package:flutter_todo_v2/controllers/category_controller.dart';
import 'package:flutter_todo_v2/controllers/task_controller.dart';
import 'package:flutter_todo_v2/helper/routes.dart';
import 'package:flutter_todo_v2/screens/category_list_screen.dart';
import 'package:flutter_todo_v2/screens/settings_screen.dart';
import 'package:flutter_todo_v2/screens/task_list_screen.dart';
import 'package:get/get.dart';

class AppPage {
  static final page = [
    GetPage(
      name: AppRoutes.TASKS,
      page: () => const TaskListScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => TaskController());
        Get.lazyPut(() => CategoryController());
      }),
    ),
    GetPage(
      name: AppRoutes.CATEGORIES,
      page: () => const CategoryListScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CategoryController());
        Get.lazyPut(() => TaskController());
      }),
    ),
    GetPage(name: AppRoutes.SETTINGS, page: () => const SettingsScreen()),
  ];
}
