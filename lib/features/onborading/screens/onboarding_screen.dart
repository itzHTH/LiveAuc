import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/widgets/animated_slider.dart';
import 'package:street_auction/features/onborading/models/page_model.dart';
import 'package:street_auction/features/onborading/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<PageModel> pages = const [
    PageModel(
      title: 'Discover an Endless World of Auctions',
      description:
          'From rare collectibles and electronics to vehicles and real estate. Browse thousands of active listings and find your golden opportunity.',
      image: 'assets/animations/onboarding_1.json',
    ),
    PageModel(
      title: 'Bid Live. Win Big. Every Second Counts.',
      description:
          'Jump into real-time auctions and feel the thrill of every bid. Stay sharp, act fast, and claim the deal before anyone else does.',
      image: 'assets/animations/onboarding_2.json',
    ),
    PageModel(
      title: 'Win Your First Auction, or Start Selling!',
      description:
          'Join our vibrant bidding community today. Snatch the best deals as a buyer, or maximize your profits by listing your own items.',
      image: 'assets/animations/onboarding_3.json',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
          child: Column(
            children: [
              AnimatedSlider(
                currentPage: _currentPage,
                totalPages: pages.length,
              ),
              SizedBox(height: 60.h),

              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  controller: _pageController,
                  itemCount: pages.length,
                  itemBuilder: (context, index) =>
                      OnboardingPage(pages: pages[index]),
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(onPressed: () {}, child: const Text('Next')),
            ],
          ),
        ),
      ),
    );
  }
}
