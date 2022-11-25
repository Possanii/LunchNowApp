import 'package:flutter/material.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';

class RestaurantMeal extends StatelessWidget {
  const RestaurantMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListTile(
        leading: Image.network(
          'https://www.aberje.com.br/wp-content/uploads/2021/04/McDonalds-Logo-1024x576.png',
          height: 60,
          width: 100,
        ),
        title: Text('nome da refeição'),
        subtitle: Text('Preço'),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.add_circle,
            color: context.primaryColor,
            size: 30,
          ),
        ),
      ),
    );
  }
}
