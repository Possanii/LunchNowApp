import 'package:flutter/material.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';
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
                    'Restaurante',
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
                'https://www.aberje.com.br/wp-content/uploads/2021/04/McDonalds-Logo-1024x576.png',
                fit: BoxFit.fill,
                errorBuilder: (context, error, stacktrace) =>
                    const SizedBox.shrink(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: RestaurantDetails(),
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
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 20, (context, index) {
            return RestaurantMeal();
          }))
        ],
      ),
    );
  }
}
