import 'package:flutter/material.dart';
import 'package:malika/themes.dart';

class GroceryChecklistItem extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) onChanged;
  final String value;
  final Function() onLongClicked;

  const GroceryChecklistItem({
    super.key,
    this.isChecked = false,
    required this.onChanged,
    required this.value,
    required this.onLongClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongClicked,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: ((isChecked) {
                    onChanged(isChecked);
                  }),
                  shape: const CircleBorder(),
                  checkColor: primaryColor,
                  fillColor: MaterialStatePropertyAll(hintTextColor),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    value,
                    style: regularTextStyle,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
