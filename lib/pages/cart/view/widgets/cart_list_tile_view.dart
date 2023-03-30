import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/models/data_models/product_data_model.dart';
import 'package:wireapps_sneaker_shop/utils/extensions.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';
import 'package:wireapps_sneaker_shop/utils/styles/sizes/app_sizes.dart';

class CartListTileView extends StatelessWidget {
  // variables

  final ProductDataModel productDataModel;

  final ValueSetter<ProductDataModel> onDeleteTapped;

  const CartListTileView({
    super.key,
    required this.productDataModel,
    required this.onDeleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // main image section
        Flexible(
          flex: 1,
          child: Container(
            height: AppSizes.height(context, of: 0.2),
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              color: AppColors.athensGray,
              borderRadius: BorderRadius.circular(
                20,
              ),
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

        const SizedBox(
          width: 12,
        ),

        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // shoe name section
              Text(
                productDataModel.name,
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
                style: TextStyle(
                  color: AppColors.mineShaft.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // delete icon button
              IconButton(
                onPressed: () {
                  onDeleteTapped(productDataModel);
                },
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.cinnabar,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
