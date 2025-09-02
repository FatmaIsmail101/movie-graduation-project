import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/page_route_name.dart';

import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;
  int currentPage = 0;
  late final List<OnboardingModel> filteredPages;

  @override
  void initState() {
    super.initState();

    int startIndex = onboardingPages.indexWhere(
      (page) => page.image.contains("heros"),
    );
    startIndex = startIndex < 0 ? 0 : startIndex;

    filteredPages = onboardingPages.sublist(startIndex);
    currentPage = 0;
    controller = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: filteredPages.length,
            itemBuilder: (context, index) {
              final page = filteredPages[index];
              return Stack(
                children: [
                  Image.asset(
                    page.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  if (page.gradientColors != null)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: page.gradientColors!,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            minChildSize: 0.25,
            maxChildSize: 0.5,
            builder: (context, scrollController) {
              final page = filteredPages[currentPage];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h)),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Text(
                      page.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      page.description ?? "",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity.w,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black, width: 2.w),
                          backgroundColor: const Color(0xFFF6BD00),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        onPressed: () {
                          if (currentPage == filteredPages.length - 1) {
                            Navigator.pushReplacementNamed(
                                context, PageRouteName.loginView);
                          } else {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: Text(
                          currentPage == filteredPages.length - 1
                              ? "Finish"
                              : "Next",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    if (currentPage > 0)
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Color(0xFFF6BD00),
                              width: 2.w,
                            ),
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                          ),
                          onPressed: () {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                              color: Color(0xFFF6BD00),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
