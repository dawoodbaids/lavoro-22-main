import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../core/theme/app_theme.dart';
import '../widgets/on_boarding_page.dart';

class OnBoardingController extends GetxController {
  late final LiquidController liquidController;

  RxInt currentPage = 0.obs;
  final RxBool _isLastPage = false.obs;

  bool get isListPage => _isLastPage.value;

  @override
  void onInit() {
    super.onInit();
    liquidController = LiquidController();

    _isLastPage(pages.length == 1);
  }

  final pages = [
    OnBoardingPage(
      description:
          'Welcome to Lavoro! Get real-time updates on training programs and technology job opportunities. Stay informed, empowered, and engaged with our user-friendly Lavoro app tailored for the tech job market.',
      data: Get.isDarkMode ? AppTheme.dark : AppTheme.light,
    ),
    OnBoardingPage(
      description:
          'Stay updated on tech job opportunities from local to national levels with Lavoro apps real-time insights.',
      data: Get.isDarkMode ? AppTheme.light : AppTheme.dark,
    ),
    OnBoardingPage(
      description:
          ' The ultimate platform for programmers and IT students to explore training and job opportunities',
      data: Get.isDarkMode ? AppTheme.dark : AppTheme.light,
    ),
  ];

  onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
    _isLastPage(activePageIndex == pages.length - 1);
  }

  skip() => liquidController.jumpToPage(page: pages.length - 1);

  animateToNextSlide() {
    int nextPage = liquidController.currentPage + 1;
    liquidController.animateToPage(page: nextPage, duration: 300);
  }
}
