part of '../home_page.dart';

class _HomeAddressWidget extends StatelessWidget {
  final HomeController controller;

  const _HomeAddressWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Estabelecimentos próximos de "),
          Observer(
            builder: (_) {
              return Text(
                controller.addressEntity?.address ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              );
            },
          )
        ],
      ),
    );
  }
}
