import 'package:flutter/material.dart';
import 'package:lunch_now/app/core/helpers/debouncer.dart';
import 'package:lunch_now/app/core/ui/extensions/size_screen_extension.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';
import 'package:lunch_now/app/modules/home/home_controller.dart';

class HomeAppbar extends SliverAppBar {
  HomeAppbar(HomeController controller, {super.key})
      : super(
          expandedHeight: 100,
          collapsedHeight: 100,
          elevation: 0,
          flexibleSpace: _LunchNowAppBar(controller),
          iconTheme: const IconThemeData(color: Colors.black),
          pinned: true,
        );
}

class _LunchNowAppBar extends StatelessWidget {
  final HomeController controller;
  final _debouncer = Debouncer(milliseconds: 500);

  _LunchNowAppBar(this.controller);

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey[200]!),
    );

    return AppBar(
      backgroundColor: Colors.grey[100],
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 12.0),
        child: Text('Lunch Now'),
      ),
      actions: [
        IconButton(
          onPressed: () {
            controller.goToAddressPage();
          },
          icon: const Icon(
            Icons.location_on,
            color: Colors.black,
          ),
        )
      ],
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          Container(
            height: 110.h,
            color: context.primaryColor,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: .9.sw,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(30),
                child: TextFormField(
                  onChanged: (value) {
                    _debouncer.run(() {
                      controller.filterSupplierByName(value);
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.grey,
                    ),
                    border: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
