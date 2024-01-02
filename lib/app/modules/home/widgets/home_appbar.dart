import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../core/theme/text_theme.dart';
import '../../../core/values/consts.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/open_drawer_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeAppBar extends GetView<HomeController>
    implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  const HomeAppBar({Key? key, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const OpenDrawerWidget(),
      title: const Text(
        AppConstant.appName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: bottom,
      actions: [
        CustomButton(
          icons: Icons.search,
          width: 35,
          height: 35,
          tooltip: 'Search',
          padding: const EdgeInsets.all(6.0),
          backgroundColor: Get.theme.colorScheme.onPrimary,
          foregroundColor: Get.theme.colorScheme.primary,
          borderRadiusValue: 10,
          onPressed: () => Get.toNamed(Routes.SEARCH),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: CustomButton(
              icons: Icons.more_vert,
              width: 35,
              height: 35,
              tooltip: 'More',
              padding: const EdgeInsets.all(6.0),
              disabledColor: Get.theme.colorScheme.onPrimary,
              foregroundColor: Get.theme.colorScheme.primary,
              borderRadiusValue: 10,
            ),
            buttonStyleData: ButtonStyleData(
              elevation: 0,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onChanged: (value) {},
            dropdownStyleData: DropdownStyleData(
              width: Get.width * .4,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: Get.theme.colorScheme.onBackground.withOpacity(.5),
                ),
              ),
              offset: const Offset(0, 8),
            ),
            items: [
              DropdownMenuItem(
                value: 'Test 1',
                child: Text(
                  'Test 1',
                  style: AppStyle.bodyText3,
                ),
              ),
              DropdownMenuItem(
                value: 'Test 2',
                child: Text(
                  'Test 2',
                  style: AppStyle.bodyText3,
                ),
              ),
              DropdownMenuItem(
                value: 'Test 3',
                child: Text(
                  'Test 3',
                  style: AppStyle.bodyText3,
                ),
              ),
              DropdownMenuItem(
                value: 'Test 4',
                child: Text(
                  'Test 4',
                  style: AppStyle.bodyText3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kBottomNavigationBarHeight);
}
