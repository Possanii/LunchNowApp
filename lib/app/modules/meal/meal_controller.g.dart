// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MealController on MealControllerBase, Store {
  late final _$_mealModelAtom =
      Atom(name: 'MealControllerBase._mealModel', context: context);

  MealModel? get mealModel {
    _$_mealModelAtom.reportRead();
    return super._mealModel;
  }

  @override
  MealModel? get _mealModel => mealModel;

  @override
  set _mealModel(MealModel? value) {
    _$_mealModelAtom.reportWrite(value, super._mealModel, () {
      super._mealModel = value;
    });
  }

  late final _$_mealByRestaurantAtom =
      Atom(name: 'MealControllerBase._mealByRestaurant', context: context);

  List<MealModel> get mealByRestaurant {
    _$_mealByRestaurantAtom.reportRead();
    return super._mealByRestaurant;
  }

  @override
  List<MealModel> get _mealByRestaurant => mealByRestaurant;

  @override
  set _mealByRestaurant(List<MealModel> value) {
    _$_mealByRestaurantAtom.reportWrite(value, super._mealByRestaurant, () {
      super._mealByRestaurant = value;
    });
  }

  late final _$getMealByIdrAsyncAction =
      AsyncAction('MealControllerBase.getMealByIdr', context: context);

  @override
  Future<void> getMealByIdr(dynamic args) {
    return _$getMealByIdrAsyncAction.run(() => super.getMealByIdr(args));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
