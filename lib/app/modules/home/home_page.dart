import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:lunch_now/app/core/ui/extensions/size_screen_extension.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';
import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/models/supplier_category_model.dart';
import 'package:lunch_now/app/models/supplier_nearbyme_model.dart';
import 'package:lunch_now/app/modules/home/home_controller.dart';
import 'package:lunch_now/app/modules/home/widgets/home_appbar.dart';

part 'widgets/home_address_widget.dart';
part 'widgets/home_categories_widget.dart';
part 'widgets/home_supplier_tab.dart';

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
      drawer: Drawer(
        child: TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Logout'),
        ),
      ),
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
              child: _HomeCategoriesWidget(controller),
            )
          ];
        },
        body: _HomeSupplierTab(
          homeController: controller,
        ),
      ),
    );
  }
}
