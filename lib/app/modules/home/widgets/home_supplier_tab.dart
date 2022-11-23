// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController _homeController;

  const _HomeSupplierTab({
    required HomeController homeController,
  }) : _homeController = homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(
          homeController: _homeController,
        ),
        Expanded(
          child: Observer(
            builder: (_) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: _homeController.supplierPageTypeSelected ==
                        SupplierPageType.list
                    ? const _HomeSupplierList()
                    : const _HomeSupplierGrid(),
              );
            },
          ),
        )
      ],
    );
  }
}

class _HomeTabHeader extends StatelessWidget {
  final HomeController homeController;

  const _HomeTabHeader({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const Text('Estabelecimentos'),
          const Spacer(),
          InkWell(
              onTap: () =>
                  homeController.changeTabSupplier(SupplierPageType.list),
              child: Observer(
                builder: (_) {
                  return Icon(
                    Icons.view_headline,
                    color: homeController.supplierPageTypeSelected ==
                            SupplierPageType.list
                        ? Colors.black
                        : Colors.grey,
                  );
                },
              )),
          InkWell(
              onTap: () =>
                  homeController.changeTabSupplier(SupplierPageType.grid),
              child: Observer(
                builder: (_) {
                  return Icon(
                    Icons.view_comfy,
                    color: homeController.supplierPageTypeSelected ==
                            SupplierPageType.grid
                        ? Colors.black
                        : Colors.grey,
                  );
                },
              )),
        ],
      ),
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  const _HomeSupplierList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) {
            return _HomeSupplierListItemWidget();
          },
        ))
      ],
    );
  }
}

class _HomeSupplierListItemWidget extends StatelessWidget {
  const _HomeSupplierListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30),
            width: 1.sw,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mc Donald's",
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 18,
                            ),
                            Text('Av.Paulista 2000'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: context.primaryColor,
                    maxRadius: 15,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 1),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[100]!,
                  width: 5,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/McDonald%27s_logo.svg/2560px-McDonald%27s_logo.svg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  const _HomeSupplierGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Supplier Grid');
  }
}
