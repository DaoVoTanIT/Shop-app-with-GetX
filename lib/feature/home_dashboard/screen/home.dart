import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/shimmer.dart';
import 'package:cmms/feature/home_dashboard/controller/home_controller.dart';
import 'package:cmms/feature/home_dashboard/widget/CSDrawerComponents.dart';
import 'package:cmms/feature/product_detail/screen/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController productsController = Get.put(HomeController());
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: _buildAppBar(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer: const DrawerPage(),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTop(),
            Obx(() => _buildCategoriesRow()),
            Expanded(
              child: Obx(
                () {
                  if (productsController.loading.value) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const ShimmerCpn();
                        });
                  }
                  if (productsController.listProduct.isEmpty) {
                    return const Center(child: Text('No products found'));
                  }
                  if (productsController.showGrid.value) {
                    return GridView.builder(
                      padding: const EdgeInsets.only(top: 16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: productsController.listProduct.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                        id: productsController
                                                .listProduct[index].id ??
                                            0,
                                      )),
                            );
                          },
                          child: Card(
                            elevation: 0.0,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(productsController
                                                .listProduct[index].image ??
                                            ''),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productsController
                                                    .listProduct[index].title ??
                                                '',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Expanded(
                                            child: Text(
                                              productsController
                                                      .listProduct[index]
                                                      .description ??
                                                  '',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$${productsController.listProduct[index].price}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  productsController.isFavorite(
                                                      productsController
                                                              .listProduct[
                                                                  index]
                                                              .id ??
                                                          0);
                                                },
                                                child: GetBuilder(
                                                  builder: (HomeController
                                                      controller) {
                                                    return Icon(
                                                        controller
                                                                    .listProduct[
                                                                        index]
                                                                    .isFavorite ==
                                                                false
                                                            ? Icons
                                                                .favorite_outline
                                                            : Icons.favorite,
                                                        color: productsController
                                                                    .listProduct[
                                                                        index]
                                                                    .isFavorite ==
                                                                true
                                                            ? Colors.redAccent
                                                            : null);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return _buildProductsList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildProductsList() {
    return ListView.builder(
      itemCount: productsController.listProduct.length,
      padding: const EdgeInsets.only(top: 16),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                      id: productsController.listProduct[index].id ?? 0,
                    )),
          );
        },
        child: Card(
          elevation: 0.0,
          child: Container(
            height: 120,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          productsController.listProduct[index].image ?? ''),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productsController.listProduct[index].title ?? '',
                          style: h5(context: context, fontWeight: '700'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            productsController.listProduct[index].description ??
                                '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: h5(
                              context: context,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${productsController.listProduct[index].price}',
                              style: h5(context: context, fontWeight: '700'),
                            ),
                            InkWell(
                              onTap: () {
                                productsController.isFavorite(
                                    productsController.listProduct[index].id ??
                                        0);
                              },
                              child: GetBuilder(
                                builder: (HomeController controller) {
                                  return Icon(
                                      controller.listProduct[index]
                                                  .isFavorite ==
                                              false
                                          ? Icons.favorite_outline
                                          : Icons.favorite,
                                      color: productsController
                                                  .listProduct[index]
                                                  .isFavorite ==
                                              true
                                          ? Colors.redAccent
                                          : null);
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cloths',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_down),
                )
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              productsController.toggleGrid();
            },
            icon: const Icon(Icons.filter_list)),
      ],
    );
  }

  Widget _buildCategoriesRow() {
    return Container(
      height: 35.0,
      margin: const EdgeInsets.only(top: 16),
      child: ListView.builder(
          itemCount: productsController.listCategory.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // return Container(
            //   margin: const EdgeInsets.only(right: 8),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(4.0),
            //     color: index == 0 ? Colors.black87 : Colors.transparent,
            //   ),
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 16.0,
            //     vertical: 8.0,
            //   ),
            //   child: Text(
            //     productsController.listCategory[index],
            //     style: TextStyle(
            //       color: index == 0 ? Colors.white : Colors.black,
            //     ),
            //   ),
            // );
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Obx(
                () => ChoiceChip(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  label: Text(productsController.listCategory[index],
                      style: h5(
                          context: context,
                          fontWeight: '600',
                          color: productsController.indexCategory.value == index
                              ? backgroundWhite
                              : black)),
                  // color of selected chip
                  selectedColor: Colors.black87,
                  // selected chip value
                  selected: productsController.indexCategory.value == index,
                  // onselected method
                  onSelected: (bool selected) {
                    _value = selected ? index : 0;
                    productsController.selectCategory(_value!);
                    productsController.getAllProductByCategory(
                        productsController.listCategory[index]);
                  },
                ),
              ),
            );
          }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: const BackButton(),
      elevation: 0,
      title: const Text(
        'NShop',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
