import 'package:flutter/material.dart';
import 'package:malika/themes.dart';

class FeaturedRecipeItem extends StatelessWidget {
  const FeaturedRecipeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(defaultPadding),
          child: const Image(
            image: AssetImage('images/img_onboarding_1.png'),
            height: 280,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        SizedBox(height: defaultPadding),
        Text(
          'Resep Ayam Kuah Santan Pedas Lezat',
          style: titleTextStyle.copyWith(
            fontSize: 24,
          ),
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const Image(
                image: AssetImage('images/img_profile.webp'),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nadia Putri',
                    style: subtitleTextStyle,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Image(
                        image: AssetImage('images/ic_heart.png'),
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '130',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '·',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '103 Reviews',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Image(
              image: AssetImage('images/ic_heart_outlined.png'),
              height: 24,
              width: 24,
            ),
          ],
        )
      ],
    );
  }
}
