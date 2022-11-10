import 'package:file_reader/features/browsing/presentation/binding/browsing_binding.dart';
import 'package:file_reader/features/browsing/presentation/page/browsing_page.dart';
import 'package:get/get.dart';

import '../../features/home/presentation/binding/home_binding.dart';
import '../../features/home/presentation/page/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.NONE;

  static final routes = [
    GetPage(
      name: AppRoutes.NONE,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.BROWSING,
      page: () => const BrowsingPage(),
      binding: BrowsingBinding(),
    ),
  ];
}
