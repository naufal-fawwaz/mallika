import 'package:flutter/material.dart';
import 'package:malika/themes.dart';

class CustomButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onButtonClicked;
  final String? imageAssets;
  final String title;

  const CustomButton({
    super.key,
    required this.type,
    required this.onButtonClicked,
    this.imageAssets,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonClicked,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
            type == ButtonType.solid ? primaryColor : backgroundColor),
        side: MaterialStatePropertyAll(
            type == ButtonType.solid ? null : BorderSide(color: outlineColor)),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageAssets != null
              ? Image(
                  image: AssetImage(imageAssets.toString()),
                  width: 24,
                  height: 24,
                )
              : const SizedBox(),
          Expanded(
            child: Text(
              title,
              style: buttonTextStyle.copyWith(
                color: type == ButtonType.solid ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

enum ButtonType { solid, outlined }
