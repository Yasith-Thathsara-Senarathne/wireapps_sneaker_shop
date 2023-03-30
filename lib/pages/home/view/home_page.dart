import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';
import 'package:wireapps_sneaker_shop/utils/styles/sizes/app_sizes.dart';
import 'package:wireapps_sneaker_shop/utils/styles/texts/app_title_texts.dart';
import 'package:wireapps_sneaker_shop/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // variables

    // app bar
    final Widget appBar = SliverAppBar(
      expandedHeight: Utils.responsiveSize(
        context,
        deviceMeasureType: DeviceMeasureType.height,
        minFraction: 0.3,
        maxFraction: 0.4,
      ),
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // app name
            Positioned(
              top: AppSizes.height(context, of: 0.08),
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // app bar
              appBar,
            ],
          ),
        ],
      ),
    );
  }
}
