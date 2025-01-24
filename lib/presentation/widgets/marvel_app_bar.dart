import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarvelAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool canPop;

  const MarvelAppBar({super.key, this.canPop = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF202020),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(
        children: [
          Visibility(
            visible: canPop,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true, // Adicionado para evitar o erro
            child: IconButton(
              icon: const Icon(CupertinoIcons.back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
          const Spacer(),
          Image.asset('images/marvel_logo.png'),
          const Spacer(),
          Visibility(
            visible: false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true, // Adicionado para evitar o erro
            child: IconButton(
              icon: const Icon(CupertinoIcons.back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
