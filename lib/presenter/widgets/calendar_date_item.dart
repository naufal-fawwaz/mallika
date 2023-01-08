import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:malika/themes.dart';

class CalendarDateItem extends StatelessWidget {
  final int currentChosenDate;
  final int date;
  final int year;
  final int month;
  final Function(int) onChosenDate;

  const CalendarDateItem({
    super.key,
    required this.currentChosenDate,
    required this.date,
    required this.year,
    required this.month,
    required this.onChosenDate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChosenDate.call(date);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Column(
          children: [
            Text(
              DateFormat('EEE').format(DateTime(year, month, date)),
              style: abelTextStyle,
            ),
            SizedBox(
              height: defaultPadding / 2,
            ),
            if (date == currentChosenDate) ...[
              Container(
                padding: const EdgeInsets.all(5),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Center(
                  child: Text(
                    date.toString(),
                    style: abelTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(5),
                width: 28,
                height: 28,
                child: Center(
                  child: Text(
                    date.toString(),
                    style: abelTextStyle,
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
