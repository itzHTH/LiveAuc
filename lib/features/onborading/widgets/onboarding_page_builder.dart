import 'package:flutter/material.dart';
import 'package:street_auction/features/onborading/models/page_model.dart';
import 'package:street_auction/features/onborading/widgets/onboarding_page.dart';

class OnboardingPageBuilder extends StatelessWidget {
  const OnboardingPageBuilder({
    super.key,
    required this.pages,
    required this.pageController,
    required this.onPageChanged,
  });
  final List<PageModel> pages;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      controller: pageController,
      itemCount: pages.length,
      itemBuilder: (context, index) => OnboardingPage(pages: pages[index]),
    );
  }
}
