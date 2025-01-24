import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:serasa/presentation/widgets/marvel_app_bar.dart';
import 'package:serasa/presentation/home/controller/home_controller.dart';
import 'package:serasa/presentation/home/widgets/marvel_featured_characters_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MarvelAppBar(),
      body: MarvelFeaturedCharactersList(
        controller: _controller,
      ),
    );
  }
}