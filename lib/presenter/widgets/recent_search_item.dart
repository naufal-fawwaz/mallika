import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malika/themes.dart';

class RecentSearchItem extends StatelessWidget {
  final double paddingTop;
  final double paddingBottom;
  final double paddingVertical;
  final Function() onCardClicked;
  final String value;

  const RecentSearchItem({
    super.key,
    this.paddingTop = 8,
    this.paddingBottom = 8,
    this.paddingVertical = 16,
    required this.onCardClicked,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCardClicked(),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: paddingTop,
              bottom: paddingBottom,
              right: paddingVertical,
              left: paddingVertical,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Sayur',
                    style: subtitleTextStyle.copyWith(fontSize: 14),
                  ),
                ),
                const Icon(
                  CupertinoIcons.clear,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
