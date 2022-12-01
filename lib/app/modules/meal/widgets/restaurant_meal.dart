import 'package:flutter/material.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';
import 'package:lunch_now/app/models/meal_model.dart';

// ignore: must_be_immutable
class RestaurantMeal extends StatelessWidget {
  final MealModel meal;

  const RestaurantMeal(this.meal);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListTile(
        leading: Image.network(
          meal.mealImgUrl,
          height: 60,
          width: 100,
        ),
        title: Text(meal.name),
        subtitle: Text(meal.price.toStringAsFixed(2)),
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
