import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:serasa/presentation/home/controller/home_controller.dart';
import 'package:serasa/presentation/home/widgets/featured_characters_list.dart';
import 'package:serasa/presentation/widgets/character_card.dart';
import 'package:serasa/presentation/widgets/paged_scrollable.dart/paged_data_scrollable.dart';

class MarvelFeaturedCharactersList extends PagedDataScrollableWidget {
  final HomeController controller;

  MarvelFeaturedCharactersList({
    super.key,
    required this.controller,
  }) : super(
    scrollController: controller.marvelCharactersScrollController,
    getCurrentPage: () => controller.marvelPageInfo,
    pagingRequest: () => controller.pagingMarvel(),
  );

  @override
  PagedDataScrollableWidgetState<MarvelFeaturedCharactersList> createState() => _MarvelFeaturedCharactersListState();
}

class _MarvelFeaturedCharactersListState extends PagedDataScrollableWidgetState<MarvelFeaturedCharactersList> {
  @override
  Widget build(BuildContext context) {
    final double cardSize = (MediaQuery.of(context).size.width - 48 - 16) / 2;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Observer(
        builder: (context) {
          return ListView(
            scrollDirection: Axis.vertical,
            controller: widget.controller.marvelCharactersScrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 24),
              FeaturedCharactersList(controller: widget.controller),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  'MARVEL CHARACTERS LIST',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  cursorColor: Colors.black,
                  onChanged: widget.controller.onSearch,
                  style: const TextStyle(color: Colors.black),
                  controller: widget.controller.searchController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Icon(CupertinoIcons.search, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    ...widget.controller.marvelCharacters.map(
                      (element) => SizedBox(
                        width: cardSize, 
                        height: cardSize,
                        child: CharacterCard(
                          character: element,
                          isLoading: widget.controller.isLoadingMarvel,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Visibility(
                visible: widget.controller.isLoadingPagingMarvel,
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
