import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lunch_now/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';
import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/modules/home/home_controller.dart';
import 'package:lunch_now/app/modules/home/widgets/home_appbar.dart';

part 'widgets/home_address_widget.dart';
part 'widgets/home_categories_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  AddressEntity? addressEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.grey[100],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            HomeAppbar(controller),
            SliverToBoxAdapter(
              child: _HomeAddressWidget(
                controller: controller,
              ),
            ),
            SliverToBoxAdapter(
              child: _HomeCategoriesWidget(),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
