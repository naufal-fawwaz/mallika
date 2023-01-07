import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malika/themes.dart';

class LastSeenItem extends StatelessWidget {
  const LastSeenItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const Image(
                  image: AssetImage('images/img_onboarding_1.png'),
                  height: 60,
                  width: 60,
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
                      'Resep Ayam Kuah Santan Pedas Lezat',
                      style: subtitleTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.av_timer),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '40 min',
                          style: regularTextStyle,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(Icons.dinner_dining),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Easy',
                          style: regularTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
