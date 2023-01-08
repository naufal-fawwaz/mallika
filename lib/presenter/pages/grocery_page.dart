import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malika/cubit/grocery/checklist_cubit.dart';
import 'package:malika/models/grocery_checklist.dart';
import 'package:malika/presenter/widgets/grocery_checklist_item.dart';
import 'package:malika/themes.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addItemController = TextEditingController();

    Widget addNewItemSection() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: TextField(
          controller: addItemController,
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
            hintText: 'Add New Item',
            hintStyle: hintTextStyle.copyWith(
              fontSize: 14,
            ),
            contentPadding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 36,
              bottom: 0,
            ),
          ),
          style: subtitleTextStyle,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onSubmitted: ((value) {
            context.read<ChecklistCubit>().addChecklist(value);
            addItemController.clear();
          }),
        ),
      );
    }

    Future<void> alertDeleteDialog() {
      return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Are you sure you want to go remove all item?',
              style: regularTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            content: Text(
              'Any changes you made will be lost.',
              style: subtitleTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Text(
                  'Cancel',
                  style: subtitleTextStyle.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ChecklistCubit>().deleteAllChecklist();
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Text(
                  'Ok',
                  style: subtitleTextStyle.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.end,
          );
        }),
      );
    }

    Future<void> showDeleteOneItem(int itemIndex) {
      return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Are you sure you want to go remove this item?',
              style: regularTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            content: Text(
              'Any changes you made will be lost.',
              style: subtitleTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Text(
                  'Cancel',
                  style: subtitleTextStyle.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ChecklistCubit>().deleteChecklist(itemIndex);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Text(
                  'Ok',
                  style: subtitleTextStyle.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.end,
          );
        }),
      );
    }

    Widget emptyGrocery() {
      return Container(
        padding: EdgeInsets.all(defaultPadding),
        margin: EdgeInsets.only(top: defaultMargin * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('images/ic_cart_grey.png'),
              width: 40,
              height: 40,
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Text(
              'Grocery is empty',
              style: GoogleFonts.abel(
                fontSize: 20,
              ),
            )
          ],
        ),
      );
    }

    Widget groceryList() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: ListView.builder(
          itemCount: context.read<ChecklistCubit>().state.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return GroceryChecklistItem(
              key: UniqueKey(),
              onChanged: (isChecked) {
                context
                    .read<ChecklistCubit>()
                    .onCheckListUpdated(index, isChecked ?? false);
              },
              onLongClicked: () {
                showDeleteOneItem(index);
              },
              value: context.read<ChecklistCubit>().state[index].title,
              isChecked: context.read<ChecklistCubit>().state[index].isChecked,
            );
          },
        ),
      );
    }

    return BlocConsumer<ChecklistCubit, List<GroceryChecklist>>(
      listener: (context, state) {
        log('State now ${DateTime.now()} $state');
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  alertDeleteDialog();
                },
                icon: const Icon(Icons.delete_outline),
                color: greyColor,
              )
            ],
            centerTitle: true,
            title: Text(
              'Grocery',
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
                addNewItemSection(),
                if (state.isNotEmpty) ...[
                  groceryList(),
                ] else ...[
                  emptyGrocery(),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
