import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:street_auction/core/widgets/app_back_button.dart';
import 'package:street_auction/core/widgets/app_step_progress_indicator.dart';
import 'package:street_auction/features/auth/ui/widgets/first_register_page.dart';
import 'package:street_auction/features/auth/ui/widgets/register_bloc_listener.dart';
import 'package:street_auction/features/auth/ui/widgets/third_register_page.dart';
import 'package:street_auction/features/auth/ui/widgets/second_register_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _pageController = PageController();

  int _currentPage = 0;

  final _emailController = TextEditingController();

  List<Widget> get _pages => [
    FirstRegisterPage(onNext: _nextPage, emailController: _emailController),
    SecondRegisterPage(onNext: _nextPage, email: _emailController.text),
    const ThirdRegisterPage(),
  ];

  void _nextPage() {
    if (_currentPage == 2) return;

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
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    super.dispose();
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
                // progress indicator
                AppStepProgressIndicator(
                  currentPage: _currentPage,
                  totalPages: _pages.length,
                ),
                // back button
                Gap(30.h),
                AppBackButton(onPressed: _previousPage),
                Gap(36.h),

                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _pages.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _pages[index];
                    },
                  ),
                ),

                const RegisterBlocListener(child: SizedBox.shrink()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
