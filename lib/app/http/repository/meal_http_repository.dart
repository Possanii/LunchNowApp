import 'dart:convert';

import 'package:lunch_now/app/modules/meal/widgets/meal_list.dart';
import 'package:lunch_now/app/models/meal_model.dart';
import 'package:http/http.dart' as http;

class MealHttpRepository implements MealList {
  @override
  Future<List<MealModel>> findAllMeals() async {
    final url = Uri.http('exemplo.com');
    final response = await http.get(url);
    final List<Map<String, dynamic>> responseMap = jsonDecode(response.body);
    return responseMap
        .map<MealModel>((resp) => MealModel.fromMap(resp))
        .toList();
  }
}
