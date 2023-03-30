import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/models/data_models/product_data_model.dart';
import 'package:wireapps_sneaker_shop/pages/product_detail/controller/product_detail_controller.dart';
import 'package:wireapps_sneaker_shop/routes/routes.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/extensions.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';
import 'package:wireapps_sneaker_shop/utils/styles/sizes/app_sizes.dart';
import 'package:wireapps_sneaker_shop/utils/styles/texts/app_button_texts.dart';
import 'package:wireapps_sneaker_shop/utils/utils.dart';
import 'package:wireapps_sneaker_shop/widgets/app_alert_dialog_view.dart';
import 'package:wireapps_sneaker_shop/widgets/app_filter_option_view.dart';
import 'package:wireapps_sneaker_shop/widgets/app_main_button.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // variables

  final ProductDetailController _productDetailController =
      Get.put(ProductDetailController());

  final productDataModel = Get.arguments as ProductDataModel;

  @override
  Widget build(BuildContext context) {
    // variables

    // app bar
    final Widget appBar = SliverAppBar(
      expandedHeight: Utils.responsiveSize(
        context,
        deviceMeasureType: DeviceMeasureType.height,
        minFraction: 0.35,
        maxFraction: 0.4,
      ),
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // product image
            Positioned(
              top: 12,
              left: 12,
              right: 12,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                height: AppSizes.height(context, of: 0.25),
                decoration: BoxDecoration(
                  color: AppColors.athensGray,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.athensGray,
                    image: DecorationImage(
                      image: NetworkImage(productDataModel.mainImage),
                      filterQuality: FilterQuality.medium,
                      fit: BoxFit.contain,
                      colorFilter: const ColorFilter.mode(
                        AppColors.athensGray,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        padding: const EdgeInsets.only(left: 24),
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.mineShaft,
          size: 30,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        // cart button
        IconButton(
          padding: const EdgeInsets.only(right: 24),
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: AppColors.mineShaft,
            size: 30,
          ),
          onPressed: () {
            Get.toNamed(
              Routes.CART,
            );

            return;
          },
        ),
      ],
      automaticallyImplyLeading: false,
    );

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // app bar
              appBar,

              // product details section
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        // product name section
                        Text(
                          productDataModel.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.mineShaft,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // space view
                        const SizedBox(
                          height: 12,
                        ),

                        // product price section
                        Text(
                          '${productDataModel.price.currency.symboleValue}${productDataModel.price.amount.toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.mineShaft.withOpacity(0.8),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // space view
                        const SizedBox(
                          height: 12,
                        ),

                        // product size section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // product size text view
                            const Text(
                              'Size',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppColors.mineShaft,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // space view
                            const SizedBox(
                              height: 12,
                            ),

                            // product size filters
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // eight shoe size
                                Obx(
                                  () => AppFilterOptionView(
                                    title: ShoeSizeType.eight.displayValue,
                                    value: ShoeSizeType.eight,
                                    groupValue: _productDetailController
                                        .shoeSizeType.value,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 20,
                                    ),
                                    onValueChanged: (value) {
                                      _productDetailController
                                          .shoeSizeType.value = value;
                                    },
                                  ),
                                ),

                                // nine shoe size
                                Obx(
                                  () => AppFilterOptionView(
                                    title: ShoeSizeType.nine.displayValue,
                                    value: ShoeSizeType.nine,
                                    groupValue: _productDetailController
                                        .shoeSizeType.value,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 20,
                                    ),
                                    onValueChanged: (value) {
                                      _productDetailController
                                          .shoeSizeType.value = value;
                                    },
                                  ),
                                ),

                                // ten shoe size
                                Obx(
                                  () => AppFilterOptionView(
                                    title: ShoeSizeType.ten.displayValue,
                                    value: ShoeSizeType.ten,
                                    groupValue: _productDetailController
                                        .shoeSizeType.value,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 20,
                                    ),
                                    onValueChanged: (value) {
                                      _productDetailController
                                          .shoeSizeType.value = value;
                                    },
                                  ),
                                ),

                                // eleven shoe size
                                Obx(
                                  () => AppFilterOptionView(
                                    title: ShoeSizeType.eleven.displayValue,
                                    value: ShoeSizeType.eleven,
                                    groupValue: _productDetailController
                                        .shoeSizeType.value,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 20,
                                    ),
                                    onValueChanged: (value) {
                                      _productDetailController
                                          .shoeSizeType.value = value;
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                        // space view
                        const SizedBox(
                          height: 12,
                        ),

                        // product size section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // product size text view
                            const Text(
                              'Description',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppColors.mineShaft,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // space view
                            const SizedBox(
                              height: 12,
                            ),

                            // product price section
                            Text(
                              productDataModel.description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: AppColors.mineShaft.withOpacity(0.5),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // bottom padding
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: Utils.responsiveSize(
                    context,
                    deviceMeasureType: DeviceMeasureType.height,
                    minFraction: 0.1,
                    maxFraction: 0.15,
                  ),
                ),
              ),
            ],
          ),

          // upload button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              color: AppColors.athensGray,
              child: AppMainButton(
                title: AppButtonTexts.addToCart,
                onTapped: () {
                  if (_productDetailController.shoeSizeType.value ==
                      ShoeSizeType.none) {
                    Utils.showSnackBar(
                      context: context,
                      alertMessage: 'Select a shoe size first.',
                    );

                    return;
                  }

                  showAlertDialog(
                    context: context,
                    title: 'Add To Cart',
                    message: 'Do you wish to add this product to cart ?',
                    onNoTapped: () {
                      Get.back();
                    },
                    onYesTapped: () {
                      Get.back();

                      Utils.addToCart(
                        productDataModel,
                        context,
                      );
                    },
                  );

                  return;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
