import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/utils/helpers/system_helper.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_choice_chip.dart';
import '../../../global_widgets/custom_textformfield.dart';

import '../controllers/my_search_controller.dart';

class SearchBody extends GetView<MySearchController> {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => SystemHelper.closeKeyboard(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomButton(
                  icons: Icons.arrow_back,
                  width: 35,
                  height: 35,
                  tooltip: 'Back',
                  padding: const EdgeInsets.all(6.0),
                  backgroundColor: Get.theme.colorScheme.onPrimary,
                  foregroundColor: Get.theme.colorScheme.primary,
                  borderRadiusValue: 10,
                  onPressed: () => Get.back(),
                ),
                Expanded(
                  child: CustomTextFormField(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    withLabel: false,
                    suffixicon: const Icon(Icons.search),
                    style: AppStyle.subTitle4,
                    onChanged: (val) {
                      controller.searchText.value = val;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 12.0),
            SizedBox(
              height: Get.height * .06,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GetX<MySearchController>(
                    builder: (_) {
                      return CustomChoiceChip(
                        label: 'All',
                        selected: controller.test1.value,
                        onChange: (value) {
                          controller.test1.value = value;
                        },
                      );
                    },
                  ),
                  GetX<MySearchController>(
                    builder: (_) {
                      return CustomChoiceChip(
                        label: 'Links',
                        icons: Icons.link,
                        selected: controller.test2.value,
                        onChange: (value) {
                          controller.test2.value = value;
                        },
                      );
                    },
                  ),
                  GetX<MySearchController>(
                    builder: (_) {
                      return CustomChoiceChip(
                        label: 'Photos',
                        icons: Icons.photo,
                        selected: controller.test3.value,
                        onChange: (value) {
                          controller.test3.value = value;
                        },
                      );
                    },
                  ),
                  GetX<MySearchController>(
                    builder: (_) {
                      return CustomChoiceChip(
                        label: 'Videos',
                        icons: Icons.video_call,
                        selected: controller.test4.value,
                        onChange: (value) {
                          controller.test4.value = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Title $index '),
                    subtitle: Text('Subtitle $index '),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
