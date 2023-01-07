import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malika/presenter/widgets/last_seen_item.dart';
import 'package:malika/presenter/widgets/recent_search_item.dart';
import 'package:malika/themes.dart';

class SearchRecipePage extends StatefulWidget {
  const SearchRecipePage({super.key});

  @override
  State<SearchRecipePage> createState() => _SearchRecipePageState();
}

class _SearchRecipePageState extends State<SearchRecipePage> {
  final List<String> list = List.generate(4, ((index) {
    return "Item ke $index";
  }));

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    Widget searchBar() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            fillColor: backgroundColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: backgroundColor),
            ),
            hintText: 'Recipe Title, Ingredient',
            hintStyle: hintTextStyle.copyWith(
              fontSize: 14,
            ),
            suffixIcon: const Icon(
              Icons.search,
              size: 24,
            ),
            suffixIconColor: greyColor,
            contentPadding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 36,
              bottom: 0,
            ),
          ),
          style: subtitleTextStyle,
        ),
      );
    }

    Widget recentSearchSectionTitle() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Text(
          'Recent Search',
          style: titleTextStyle.copyWith(fontSize: 18),
        ),
      );
    }

    Widget recentSearchSection() {
      return Container(
        margin: EdgeInsets.only(top: defaultPadding),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return RecentSearchItem(
              key: UniqueKey(),
              onCardClicked: () {
                setState(() {
                  list.removeAt(index);
                  log(list.toString());
                });
              },
              value: list[index],
            );
          },
          shrinkWrap: true,
          primary: false,
        ),
      );
    }

    Widget lastSeenTitle() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Text(
          'Last Seen',
          style: titleTextStyle.copyWith(fontSize: 18),
        ),
      );
    }

    Widget lastSeenSection() {
      return Container(
        margin: EdgeInsets.only(top: defaultPadding),
        child: Column(
          children: const [
            LastSeenItem(),
            LastSeenItem(),
            LastSeenItem(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search Recipe',
          style: subtitleTextStyle.copyWith(
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 1),
          child: Container(
            height: 1,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFE5E5E5),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchBar(),
            if (list.isNotEmpty) ...[
              recentSearchSectionTitle(),
              recentSearchSection(),
            ],
            lastSeenTitle(),
            lastSeenSection(),
            SizedBox(
              height: defaultMargin * 2,
            )
          ],
        ),
      ),
    );
  }
}
