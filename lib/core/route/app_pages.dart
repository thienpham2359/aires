import 'package:file_reader/features/unknown/presentation/binding/unknown_binding.dart';
import 'package:file_reader/features/unknown/presentation/page/unknown_page.dart';
import 'package:get/get.dart';

import '../../features/app/presentation/binding/installed_app_binding.dart';
import '../../features/app/presentation/page/installed_app_page.dart';
import '../../features/audio/presentation/binding/image_binding.dart';
import '../../features/audio/presentation/page/audio_page.dart';
import '../../features/browse/presentation/binding/browse_binding.dart';
import '../../features/browse/presentation/page/browse_page.dart';
import '../../features/document/presentation/binding/document_binding.dart';
import '../../features/document/presentation/page/document_page.dart';
import '../../features/download/presentation/binding/download_binding.dart';
import '../../features/download/presentation/page/download_page.dart';
import '../../features/encrypt/presentation/binding/encrypt_binding.dart';
import '../../features/encrypt/presentation/page/encrypt_page.dart';
import '../../features/home/presentation/binding/home_binding.dart';
import '../../features/home/presentation/page/home_page.dart';
import '../../features/image/presentation/binding/image_binding.dart';
import '../../features/image/presentation/page/image_page.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.NONE;

  static final routes = [
    GetPage(
      name: AppRoutes.UNKNOWN,
      page: () => const UnknownPage(),
      binding: UnknownBinding(),
    ),
    GetPage(
      name: AppRoutes.NONE,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.BROWSING,
      page: () => const BrowsePage(),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: AppRoutes.DOWNLOAD,
      page: () => const DownloadPage(),
      binding: DownloadBinding(),
    ),
    GetPage(
      name: AppRoutes.IMAGE,
      page: () => const ImagePage(),
      binding: ImageBinding(),
    ),
    GetPage(
      name: AppRoutes.AUDIO,
      page: () => const AudioPage(),
      binding: AudioBinding(),
    ),
    GetPage(
      name: AppRoutes.APP,
      page: () => const InstalledAppPage(),
      binding: InstalledAppBinding(),
    ),
    GetPage(
      name: AppRoutes.DOCUMENT,
      page: () => const DocumentPage(),
      binding: DocumentBinding(),
    ),
    GetPage(
      name: AppRoutes.ENCRYPT,
      page: () => const EncryptPage(),
      binding: EncryptBinding(),
    ),
  ];

}
