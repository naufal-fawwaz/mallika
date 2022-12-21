import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malika/presenter/widgets/custom_text_field.dart';
import 'package:malika/themes.dart';

class SearchRecipePage extends StatelessWidget {
  const SearchRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

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
            Container(
              margin: EdgeInsets.all(defaultMargin),
              child: TextField(
                controller: _searchController,
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
            )
          ],
        ),
      ),
    );
  }
}
