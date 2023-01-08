import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:malika/cubit/cubit.dart';
import 'package:malika/presenter/widgets/calendar_date_item.dart';
import 'package:malika/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final now = context.read<RecipeScheduleCubit>().state.date;
    final month = DateFormat('MMMM').format(now);
    final lastDateOnCurrentMonth = DateTime(now.year, now.month + 1, 0);

    Widget calendar() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(lastDateOnCurrentMonth.day, (index) {
            return CalendarDateItem(
              currentChosenDate:
                  context.read<RecipeScheduleCubit>().state.currentChosenDate,
              date: index + 1,
              year: now.year,
              month: now.month,
              onChosenDate: (currentDateChosen) {
                context
                    .read<RecipeScheduleCubit>()
                    .onUpdateCurrentDate(currentDateChosen);
              },
            );
          }),
        ),
      );
    }

    Widget recipeListHeader() {
      int currentDate =
          context.read<RecipeScheduleCubit>().state.currentChosenDate;
      String currentDay = DateFormat('EEEEE')
          .format(DateTime(now.year, now.month, currentDate));
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        margin: EdgeInsets.only(top: defaultMargin, bottom: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$currentDay $currentDate',
              style: abelTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
    }

    Widget recipeList() {
      return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              log('Cliked recipe');
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Breakfast',
                            style: abelTextStyle.copyWith(
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Sup Makaroni Daging Ayam',
                            style: abelTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 0.5,
                  decoration: const BoxDecoration(
                    color: Color(0xffB3B4BA),
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    PreferredSizeWidget appBar() {
      return AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                log('Tap Menu');
              },
              child: const Image(
                image: AssetImage('images/ic_options.png'),
                width: 24,
                height: 24,
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          month,
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
      );
    }

    return BlocConsumer<RecipeScheduleCubit, RecipeScheduleCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                calendar(),
                recipeListHeader(),
                recipeList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
