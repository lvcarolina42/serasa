import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:serasa/presentation/character_details/controller/character_details_controller.dart';

class CharacterDetailsModule extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CharacterDetailsController(
        getCharacterDetailsUseCase: GetIt.I(),
      ),
    );
  }
}
