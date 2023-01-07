import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malika/cubit/grocery/checklist_cubit.dart';
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
            log(value);
          }),
        ),
      );
    }

    Future<void> alertDeleteDialog() {
      return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('Delete All?'),
            content: const Text('You Want delete?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        }),
      );
    }

    return BlocConsumer<ChecklistCubit, Map<String, bool>>(
      listener: (context, state) {
        log('State now $state');
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
                Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  child: Column(
                    children: state.entries
                        .map(
                          (e) => GroceryChecklistItem(
                            key: UniqueKey(),
                            onChanged: (key, isChecked) {
                              log('Key is $key value is $isChecked');
                              log('State is $state');
                              context
                                  .read<ChecklistCubit>()
                                  .onCheckListUpdated(key, isChecked ?? false);
                            },
                            value: e.key,
                            isChecked: e.value,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
