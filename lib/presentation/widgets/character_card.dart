import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serasa/domain/characters/model/character_model.dart';
import 'package:serasa/presentation/widgets/default_shimmer.dart';
import 'package:serasa/shared/app_routes/paths.dart';

class CharacterCard extends StatelessWidget {
  final bool isLoading;
  final bool isFeatured;
  final CharacterModel character;

  const CharacterCard({
    super.key,
    required this.isLoading,
    this.isFeatured = false,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    final double? size = isFeatured ? 180 : null;
    return DefaultShimmer(
      isShimmerVisible: isLoading,
      child: InkWell(
        onTap: () => Get.toNamed(Paths.characterDetails, arguments: character),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: !isLoading ? DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                character.thumbnail.imageUrl,
              ),
            ) : null,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 61.0,
              padding: const EdgeInsets.symmetric(
                vertical: 7.0,
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.62), Colors.transparent],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  character.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: "Roboto",
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}
