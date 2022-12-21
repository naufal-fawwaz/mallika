import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malika/themes.dart';

import '../widgets/cookbook_card.dart';
import '../widgets/featured_recipe_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCookbookPosition = 0;
  final CarouselController _cookbookController = CarouselController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    Widget profileHeader() {
      return Container(
        padding: EdgeInsets.only(
          top: defaultPadding,
          left: defaultPadding,
          right: defaultPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 44,
              height: 44,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/img_profile.webp'),
              ),
            ),
            SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hi Nassya',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'What are you cooking today?',
                    style: greyTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.notifications_outlined,
              ),
            ),
          ],
        ),
      );
    }

    Widget cookBooks() {
      List<Widget> cookbookList = [
        const CookbookCard(),
        const CookbookCard(),
        const CookbookCard(),
      ];
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cookbooks',
                    style: titleTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '1/3',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding),
            CarouselSlider(
              items: cookbookList,
              options: CarouselOptions(
                height: 450,
                onPageChanged: ((index, reason) {
                  setState(() {
                    _currentCookbookPosition = index;
                  });
                }),
              ),
              carouselController: _cookbookController,
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cookbookList.map((e) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration:
                      _currentCookbookPosition == cookbookList.indexOf(e)
                          ? BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            )
                          : BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                            ),
                );
              }).toList(),
            )
          ],
        ),
      );
    }

    Widget featuredRecipesHeader() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin * 2),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Community Recipes',
              style: titleTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Get lots of recipe inspiration from the community',
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
      );
    }

    Widget featuredRecipes() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FeaturedRecipeItem(),
            SizedBox(height: defaultMargin * 2),
            const FeaturedRecipeItem(),
            SizedBox(height: defaultMargin * 2),
            const FeaturedRecipeItem(),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Show All Recipe by Community',
              style: regularTextStyle.copyWith(
                color: primaryColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget category() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                'Category',
                style: titleTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: defaultPadding),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: defaultPadding),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          child: const Image(
                            image: AssetImage('images/img_onboarding_1.png'),
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Text(
                          'Seasonal',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          child: const Image(
                            image: AssetImage('images/img_onboarding_1.png'),
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Text(
                          'Seasonal',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          child: const Image(
                            image: AssetImage('images/img_onboarding_1.png'),
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Text(
                          'Seasonal',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          child: const Image(
                            image: AssetImage('images/img_onboarding_1.png'),
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Text(
                          'Seasonal',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          child: const Image(
                            image: AssetImage('images/img_onboarding_1.png'),
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Text(
                          'Seasonal',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          child: const Image(
                            image: AssetImage('images/img_onboarding_1.png'),
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Text(
                          'Seasonal',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          child: const Image(
                            image: AssetImage('images/img_onboarding_1.png'),
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Text(
                          'Seasonal',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileHeader(),
              cookBooks(),
              featuredRecipesHeader(),
              featuredRecipes(),
              category(),
              SizedBox(height: defaultMargin * 2)
            ],
          ),
        ),
      ),
    );
  }
}
