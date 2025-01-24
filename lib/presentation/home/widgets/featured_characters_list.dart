import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:serasa/presentation/home/controller/home_controller.dart';
import 'package:serasa/presentation/widgets/character_card.dart';
import 'package:serasa/presentation/widgets/paged_scrollable.dart/paged_data_scrollable.dart';

class FeaturedCharactersList extends PagedDataScrollableWidget {
  final HomeController controller;

  FeaturedCharactersList({
    super.key,
    required this.controller,
  }) : super(
    pagingRequest: () => controller.pagingFeatured(),
    getCurrentPage: () => controller.featuredPageInfo,
    scrollController: controller.featuredCharactersScrollController,
  );

  @override
  PagedDataScrollableWidgetState<FeaturedCharactersList> createState() => _FeaturedCharactersListState();
}

class _FeaturedCharactersListState extends PagedDataScrollableWidgetState<FeaturedCharactersList> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                'FEATURED CHARACTERS',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: widget.scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...widget.controller.featuredCharacters.map(
                    (element) => Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: CharacterCard(
                        isFeatured: true,
                        character: element,
                        isLoading: widget.controller.isLoadingFeatured,
                      ),
                    ),
                  ),
                  if (widget.controller.isLoadingPagingFeatured) ...[
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}