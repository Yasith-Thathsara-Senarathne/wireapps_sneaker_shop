import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/models/viewtype_models/menu_bar_viewtype_model.dart';
import 'package:wireapps_sneaker_shop/pages/bottom_menu/view/widgets/menu_item_view.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';
import 'package:wireapps_sneaker_shop/utils/styles/sizes/app_sizes.dart';

class BottomNavigationView extends StatelessWidget {
  // variables

  final int selectedIndex;

  final List<MenuBarViewTypeModel> menuBarViewTypeModelList;

  final ValueSetter<int> onMenuTapped;

  const BottomNavigationView({
    super.key,
    required this.selectedIndex,
    required this.menuBarViewTypeModelList,
    required this.onMenuTapped,
  });

  @override
  Widget build(BuildContext context) {
    // variables

    // bottom safe area height
    final bottomSafeAreaHeight =
        AppSizes.bottomPadding(context) == 0.0 ? 0.0 : 15.0;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // bottom navigation view section
          Container(
            height: AppSizes.tabBarViewHeight,
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.mineShaft,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  offset: const Offset(
                    0,
                    5,
                  ),
                  blurRadius: 15,
                  spreadRadius: 8,
                )
              ],
            ),
            child: OverflowBox(
              alignment: Alignment.center,
              maxHeight:
                  AppSizes.setBottomPaddingGetTabBarContentHeight(context),
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: menuBarViewTypeModelList.map(
                    (menuBarViewTypeModel) {
                      int index = menuBarViewTypeModelList
                          .indexOf(menuBarViewTypeModel);

                      return Flexible(
                        child: InkWell(
                          onTap: () {
                            onMenuTapped(index);
                          },
                          child: MenuItemView(
                            menuBarViewTypeModel: menuBarViewTypeModel,
                            isSelected: selectedIndex == index,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),

          // botom safe area space view
          SizedBox(
            height: bottomSafeAreaHeight,
          ),
        ],
      ),
    );
  }
}
