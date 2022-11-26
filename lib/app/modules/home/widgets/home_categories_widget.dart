part of '../home_page.dart';

class _HomeCategoriesWidget extends StatelessWidget {
  final HomeController _controller;
  const _HomeCategoriesWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Observer(
        builder: (_) {
          return Center(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _controller.listCategories.length,
                itemBuilder: (context, index) {
                  final category = _controller.listCategories[index];
                  return _CategoryItem(category, _controller);
                }),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final SupplierCategoryModel category;
  final HomeController _controller;

  static const _categoriesIcons = {
    'Pizza': Icons.local_pizza,
    'Hamburguer': Icons.lunch_dining,
    'Churrasco': Icons.outdoor_grill,
    'Drinks': Icons.local_drink,
    'Frutas': Icons.apple,
  };

  _CategoryItem(this.category, this._controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.filterSuppliersCategory(category);
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return CircleAvatar(
                  backgroundColor:
                      _controller.supplierCategoryFilterSelected?.name ==
                              category.name
                          ? context.primaryColor
                          : context.primaryColorLight,
                  radius: 30,
                  child: Icon(
                    _categoriesIcons[category.name],
                    color: Colors.black,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Text(category.name)
          ],
        ),
      ),
    );
  }
}
