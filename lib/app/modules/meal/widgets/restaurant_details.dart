// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';

class RestaurantDetails extends StatelessWidget {
  final String argsName;
  final String argsStreet;
  final String argsNumber;
  RestaurantDetails(
    this.argsName,
    this.argsStreet,
    this.argsNumber,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Center(
            child: Text(
              argsName,
              style: context.textTheme.titleLarge,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.location_city,
            color: Colors.black,
          ),
          title: Text(argsStreet + ", " + argsNumber),
        ),
        Divider(
          thickness: 1,
          color: context.primaryColor,
        ),
      ],
    );
  }
}
