import 'package:get/get.dart';
import 'package:serasa/di/character_details_module.dart';
import 'package:serasa/di/home_module.dart';
import 'package:serasa/presentation/character_details/character_details_page.dart';
import 'package:serasa/presentation/home/home_page.dart';
import 'package:serasa/shared/app_routes/paths.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(
      name: Paths.homePage,
      page: () => const HomePage(),
      binding: HomeModule(),
    ),
    GetPage(
      name: Paths.characterDetails,
      page: () => const CharacterDetailsPage(),
      binding: CharacterDetailsModule(),
    ),
  ];
}