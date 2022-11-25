import 'package:flutter/material.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Center(
            child: Text(
              'Restaurante',
              style: context.textTheme.titleLarge,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.location_city,
            color: Colors.black,
          ),
          title: Text('Endereço'),
        ),
        Divider(
          thickness: 1,
          color: context.primaryColor,
        ),
      ],
    );
  }
}
