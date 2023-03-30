import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/pages/cart/controller/cart_controller.dart';
import 'package:wireapps_sneaker_shop/pages/cart/view/widgets/cart_list_tile_view.dart';
import 'package:wireapps_sneaker_shop/pages/home/view/widgets/product_list_tile_view.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';
import 'package:wireapps_sneaker_shop/utils/styles/texts/app_button_texts.dart';
import 'package:wireapps_sneaker_shop/utils/utils.dart';
import 'package:wireapps_sneaker_shop/widgets/app_alert_dialog_view.dart';
import 'package:wireapps_sneaker_shop/widgets/app_main_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // variables

  final CartController _cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();

    // fetch data
    _fetchData();
  }

  void _fetchData() async {
    try {
      // fetch cart products
      await _cartController.fetchCartProducts();
    } catch (exception) {
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  // get related widgets
  List<Widget> getRelatedWidgets({required Widget appBar}) {
    try {
      if (_cartController.loading.value) {
        return [
          // app bar
          appBar,

          // top padding
          const SliverPadding(
            padding: EdgeInsets.only(
              top: 10,
            ),
          ),

          // basic details title tile view
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Center(
                  child: Text(
                    'Loading Data.',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                minFraction: 0.05,
                maxFraction: 0.07,
              ),
            ),
          ),
        ];
      }

      if (_cartController.cartProductList.value.isEmpty) {
        return [
          // app bar
          appBar,

          // top padding
          const SliverPadding(
            padding: EdgeInsets.only(
              top: 10,
            ),
          ),

          // basic details title tile view
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Center(
                  child: Text(
                    'No Data Found!',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                minFraction: 0.05,
                maxFraction: 0.07,
              ),
            ),
          ),
        ];
      }

      return [
        // app bar
        appBar,

        // top padding
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 10,
          ),
        ),

        // audit list tile view
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: _cartController.cartProductList.length,
            (context, index) => GetBuilder<CartController>(
              init: _cartController,
              builder: (controller) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                child: CartListTileView(
                  productDataModel: _cartController.cartProductList[index],
                  onDeleteTapped: (productDataModel) {
                    showAlertDialog(
                      context: context,
                      title: 'Remove From Cart',
                      message: 'Do you wish to remove this product from cart ?',
                      onNoTapped: () {
                        Get.back();
                      },
                      onYesTapped: () {
                        Get.back();

                        Utils.removeFromCart(
                          productDataModel,
                          context,
                        );

                        _cartController.fetchCartProducts();
                      },
                    );
                  },
                ),
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
              minFraction: 0.2,
              maxFraction: 0.25,
            ),
          ),
        ),
      ];
    } catch (exception) {
      return [
        // app bar
        appBar,

        // top padding
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 10,
          ),
        ),

        // basic details title tile view
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) => const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Expanded(
                child: Center(
                  child: Text(
                    'No Data Found!',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
              minFraction: 0.05,
              maxFraction: 0.07,
            ),
          ),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // variables

    // app bar
    final Widget appBar = SliverAppBar(
      expandedHeight: Utils.responsiveSize(
        context,
        deviceMeasureType: DeviceMeasureType.height,
        minFraction: 0.05,
        maxFraction: 0.05,
      ),
      floating: false,
      pinned: true,
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
      automaticallyImplyLeading: false,
    );

    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            CustomScrollView(
              slivers: getRelatedWidgets(
                appBar: appBar,
              ),
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
                color: AppColors.white,
                child: Column(
                  children: [
                    // total amount section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            color: AppColors.mineShaft.withOpacity(0.6),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Utils.sumOfItemsOnBag(),
                          style: const TextStyle(
                            color: AppColors.mineShaft,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // space view
                    const SizedBox(
                      height: 40,
                    ),

                    // checkout button
                    AppMainButton(
                      title: AppButtonTexts.checkout,
                      onTapped: () {
                        return;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
