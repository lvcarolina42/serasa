import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:serasa/presentation/character_details/controller/character_details_controller.dart';
import 'package:serasa/presentation/widgets/marvel_app_bar.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({super.key});

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  final CharacterDetailsController _controller = Get.find<CharacterDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xFF202020),
          appBar: const MarvelAppBar(canPop: true,),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 375,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        _controller.characterDetails.thumbnail.imageUrl,
                      ),
                    )
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 127.0,
                      padding: const EdgeInsets.symmetric(
                        vertical: 7.0,
                        horizontal: 16.0,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [Color(0xFF202020), Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    _controller.characterDetails.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "BIOGRAPHY",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                AnimatedCrossFade(
                  crossFadeState: _controller.isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 300),
                  firstChild: const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  secondChild: _controller.characterDetails.description.isNotEmpty ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      _controller.characterDetails.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ) : const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "Nenhuma biografia disponível",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}