import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/pages/home/controller/home_controller.dart';
import 'package:wireapps_sneaker_shop/pages/home/view/widgets/product_list_tile_view.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';
import 'package:wireapps_sneaker_shop/utils/styles/texts/app_title_texts.dart';
import 'package:wireapps_sneaker_shop/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // varibals

  final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();

    // fetch data
    _fetchData();
  }

  void _fetchData() async {
    try {
      // fetch products
      RemoteResponseType result = await _homeController.fetchProducts();

      print(result);
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
      if (_homeController.loading.value) {
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

      if (_homeController.productList.value.isEmpty) {
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
            childCount: _homeController.productList.length,
            (context, index) => GetBuilder<HomeController>(
              init: _homeController,
              builder: (controller) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                child: ProductListTileView(
                  productDataModel: _homeController.productList[index],
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
              minFraction: 0.12,
              maxFraction: 0.15,
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
        minFraction: 0.15,
        maxFraction: 0.2,
      ),
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // app name
            Positioned(
              left: 20,
              right: 20,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // app name section

                  // sneaker text view
                  Text(
                    AppTitleTexts.sneaker,
                    style: TextStyle(
                      color: AppColors.mineShaft,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // shop text view
                  Text(
                    AppTitleTexts.shop,
                    style: TextStyle(
                      color: AppColors.mineShaft,
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
          ],
        ),
      ),
    );
  }
}
