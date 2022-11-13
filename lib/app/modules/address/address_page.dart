import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:lunch_now/app/core/database/sqlite_connection_factory.dart';
import 'package:lunch_now/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';
import 'package:lunch_now/app/models/place_model.dart';
import 'package:lunch_now/app/modules/address/address_controller.dart';
import 'package:lunch_now/app/modules/address/widget/address_search_widget/address_search_controller.dart';

part 'widget/address_search_widget/address_search_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState
    extends PageLifeCycleState<AddressController, AddressPage> {
  @override
  Widget build(BuildContext context) {
    Modular.get<SqliteConnectionFactory>().openConnection();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColorDark),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Text(
                'Adicione ou escolha um endereço',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _AddressSearchWidget(
                addressSelectedCallback: (place) {
                  Modular.to.pushNamed('/address/detail/', arguments: place);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'Localização Atual',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) {
                  return Column(
                    children: controller.addresses
                        .map((a) => _ItemTile(address: a.address))
                        .toList(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
