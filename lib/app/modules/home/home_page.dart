import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:lunch_now/app/entities/address_entity.dart';
import 'package:lunch_now/app/modules/home/home_controller.dart';
import 'package:lunch_now/app/services/address/address_service.dart';

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
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              await Modular.to.pushNamed('/address/');
            },
            child: const Text('Selecionar um endereço'),
          ),
          TextButton(
            onPressed: () async {
              final address =
                  await Modular.get<AddressService>().getAddressSelected();
              setState(() {
                addressEntity = address;
              });
            },
            child:
                Text(addressEntity?.address ?? 'Nenhum endereço selecionado'),
          ),
        ],
      ),
    );
  }
}
