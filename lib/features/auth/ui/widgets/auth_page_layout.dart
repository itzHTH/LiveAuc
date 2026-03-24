import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:street_auction/core/widgets/app_back_button.dart';
import 'package:street_auction/core/widgets/app_step_progress_indicator.dart';
import 'package:street_auction/features/auth/ui/widgets/auth_page_controller.dart';

class AuthPageLayout extends StatefulWidget {
  const AuthPageLayout({
    super.key,
    required this.pages,
    required this.blocListener,
    required this.controller,
  });

  /// The pages displayed inside the PageView.
  final List<Widget> pages;

  /// A BlocListener widget placed at the bottom of the tree.
  final Widget blocListener;

  /// Controller that exposes [nextPage] and [previousPage] to page widgets.
  final AuthPageController controller;

  @override
  State<AuthPageLayout> createState() => _AuthPageLayoutState();
}

class _AuthPageLayoutState extends State<AuthPageLayout> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    widget.controller.attach(
      nextPage: _nextPage,
      previousPage: _previousPage,
    );
  }

  @override
  void dispose() {
    widget.controller.detach();
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage == widget.pages.length - 1) return;
    _pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    if (_currentPage == 0) {
      Navigator.pop(context);
      return;
    }
    _pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentPage == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _previousPage();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Gap(24.h),
                AppStepProgressIndicator(
                  currentPage: _currentPage,
                  totalPages: widget.pages.length,
                ),
                Gap(30.h),
                AppBackButton(onPressed: _previousPage),
                Gap(36.h),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.pages.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) => widget.pages[index],
                  ),
                ),
                widget.blocListener,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
