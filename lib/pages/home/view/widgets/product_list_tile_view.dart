import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/models/data_models/product_data_model.dart';
import 'package:wireapps_sneaker_shop/utils/extensions.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';
import 'package:wireapps_sneaker_shop/utils/styles/sizes/app_sizes.dart';

class ProductListTileView extends StatelessWidget {
  // variables

  final ProductDataModel productDataModel;

  const ProductListTileView({
    super.key,
    required this.productDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Stack(
        children: [
          // main image section
          Positioned(
            top: -30,
            left: 30,
            right: 30,
            bottom: 30,
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

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // shoe name section
                Text(
                  productDataModel.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.mineShaft,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //space view
                const SizedBox(
                  height: 6,
                ),

                // shoe price section
                Text(
                  '${productDataModel.price.currency.symboleValue}${productDataModel.price.amount.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.mineShaft,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
