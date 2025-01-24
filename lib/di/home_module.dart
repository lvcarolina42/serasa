import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:serasa/presentation/home/controller/home_controller.dart';

class HomeModule extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        getCharactersUseCase: GetIt.I(),
      )
    );
  }
}
