import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';
import 'package:lunch_now/app/modules/meal/meal_controller.dart';
import 'package:lunch_now/app/modules/meal/widgets/restaurant_details.dart';
import 'package:lunch_now/app/modules/meal/widgets/restaurant_meal.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  late ScrollController _scrollController;
  bool sliverCollapsed = false;
  ValueNotifier<bool> sliverCollapsedVN = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 180 &&
          !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = true;
      } else if (_scrollController.offset <= 180 &&
          !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final controller = Modular.get<MealController>();
    controller.getMealByIdr(args['id']);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Meu Carrinho'),
        icon: Icon(Icons.shopping_cart),
        backgroundColor: context.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            title: ValueListenableBuilder<bool>(
              valueListenable: sliverCollapsedVN,
              builder: (_, sliverCollapsedValue, child) {
                return Visibility(
                  visible: sliverCollapsedValue,
                  child: Text(
                    args['name'],
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.network(
                args['img'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stacktrace) =>
                    const SizedBox.shrink(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:
                RestaurantDetails(args['name'], args['street'], args['number']),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Refeições',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Observer(
            builder: (_) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: controller.mealByRestaurant.length,
                    (context, index) {
                  final meal = controller.mealByRestaurant[index];
                  return RestaurantMeal(meal);
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
