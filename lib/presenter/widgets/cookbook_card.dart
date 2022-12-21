import 'package:flutter/material.dart';
import 'package:malika/themes.dart';

class CookbookCard extends StatelessWidget {
  const CookbookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(48)),
      child: Card(
        shadowColor: Colors.transparent,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultMargin),
                  topRight: Radius.circular(defaultMargin),
                ),
                child: const Image(
                  image: AssetImage('images/img_onboarding_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 200,
                    left: defaultPadding,
                    right: defaultPadding,
                  ),
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultMargin),
                      topRight: Radius.circular(defaultMargin),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(color: outlineColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('images/ic_chef.png'),
                              width: 20,
                              height: 20,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Text(
                        'Buku resep spesial antara',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: titleTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        'Keep it easy with these simple but delicious recipes.',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: subtitleTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text('1.3k Likes'),
                          Text('|'),
                          Text('7 Recipes'),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
