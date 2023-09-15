import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/shimmer.dart';
import 'package:cmms/feature/product_detail/controller/detail_product_controller.dart';
import 'package:cmms/feature/product_detail/widget/page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

final DetailProductController controller = Get.put(DetailProductController());

class ProductDetailScreen extends StatefulWidget {
  final int id;
  const ProductDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    controller.count = 0.obs;
    controller.getDetailProduct(widget.id);
    super.initState();
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }

  Widget productPageView(double width, double height) {
    return Container(
      height: height * 0.42,
      width: width,
      decoration: const BoxDecoration(
        //    color: Color(0xFFE5E6E8),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(200),
          bottomLeft: Radius.circular(200),
        ),
      ),
      child: Image.network(controller.detailProduct.value.image ?? ''),
      // child: CarouselSlider(items: product.image),
    );
  }

  Widget _ratingBar(BuildContext context) {
    return Wrap(
      spacing: 30,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: controller.detailProduct.value.rating?.rate ?? 0,
          direction: Axis.horizontal,
          itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (_) {},
        ),
        Text(
          '(${controller.detailProduct.value.rating?.count} Reviews)',
          style: h3(context: context),
        )
      ],
    );
  }

  // Widget productSizesListView() {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundWhite,
        //  extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: PageWrapper(
            child: Obx(() {
              if (controller.loading.value) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const ShimmerCpn();
                    });
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //   controller.detailProduct.value.image ?? '',
                  //   height: height * 0.3,
                  //   width: width,
                  // ),
                  productPageView(width, height),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.detailProduct.value.title ?? '',
                          style: h1(context: context, fontWeight: '700'),
                        ),
                        const SizedBox(height: 10),
                        _ratingBar(context),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            // Text(
                            //   product.off != null
                            //       ? "\$${product.off}"
                            //       : "\$${product.price}",
                            //   style: Theme.of(context).textTheme.displayLarge,
                            // ),
                            // const SizedBox(width: 3),
                            Text('\$${controller.detailProduct.value.price}',
                                style: h3(context: context, fontWeight: '700')),
                            const Spacer(),
                            // Text(
                            //   product.isAvailable
                            //       ? 'Available in stock'
                            //       : 'Not available',
                            //   style: const TextStyle(fontWeight: FontWeight.w500),
                            // )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'About',
                          style: h3(context: context, fontWeight: '700'),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.detailProduct.value.description ?? '',
                          style: h5(context: context),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Quantity',
                              style: h5(context: context, fontWeight: '700'),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                controller.increQuantity();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(color: grey300)),
                                child: const Icon(
                                  Icons.add,
                                  color: grey500,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Obx(
                              () => Text(
                                controller.count.toString(),
                                style: h5(
                                  context: context,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                controller.desQuantity();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(color: grey300)),
                                child: const Icon(
                                  Icons.remove,
                                  color: grey500,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            //  onPressed: controller.addToCart(product),
                            child: const Text('Add to cart'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
