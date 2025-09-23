import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/views/update_profile_view.dart';
import 'package:movies/widgets/custom_button.dart';

import 'core/constants/assets.dart'; // مهم جداً

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String userName = "John Safwat";
  final int wishListCount = 12;
  final int historyCount = 10;
  int selectedAvatarIndex = 1;
  int selectedTab = 0; // 0 = Watch List, 1 = History

  final List<String> avatars = const [
    AppAssets.image1,
    AppAssets.image2,
    AppAssets.image3,
    AppAssets.image4,
    AppAssets.image5,
    AppAssets.image6,
    AppAssets.image7,
    AppAssets.image8,
    AppAssets.image9,
  ];

  void _editProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateProfileView(
          name: userName,
          avatarIndex: selectedAvatarIndex,
        ),
      ),
    );

    if (result != null && result is Map) {
      setState(() {
        userName = result['name'] ?? userName;
        selectedAvatarIndex = result['avatarIndex'] ?? selectedAvatarIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF121312),
        body: Column(
          children: [
            // الجزء العلوي لحد الـTabs
            Container(
              color: const Color(0xFF282A28),
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          // صورة البروفايل اللي فوق بس
                          CircleAvatar(
                            radius: 40.r,
                            backgroundImage: AssetImage(
                              avatars[selectedAvatarIndex],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            userName,
                            style: theme.textTheme.headlineSmall!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "$wishListCount",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              const Text(
                                "Wish List",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(width: 40.w),
                          Column(
                            children: [
                              Text(
                                "$historyCount",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              const Text(
                                "History",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "Edit Profile",
                          color: const Color(0xFFF6BD00),
                          onTap: _editProfile,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomButton(
                          text: "Exit",
                          color: Colors.red,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // التابز (واتش ليست/هيستوري) مع الخط الاصفر المتحرك
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Watch List Tab
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(Icons.list,
                                color: const Color(0xFFF6BD00), size: 30),
                            Text("Watch List",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: selectedTab == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal)),
                            SizedBox(height: 4),
                            Container(
                              height: 4,
                              width: 70,
                              color: selectedTab == 0
                                  ? const Color(0xFFF6BD00)
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                      // History Tab
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(Icons.folder,
                                color: const Color(0xFFF6BD00), size: 30),
                            Text("History",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: selectedTab == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal)),
                            SizedBox(height: 4),
                            Container(
                              height: 4,
                              width: 70,
                              color: selectedTab == 1
                                  ? const Color(0xFFF6BD00)
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // الجزء السفلي: صورة البوبكورن فقط
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFF121312),
                child: Center(
                  child: Image.asset(AppAssets.popCornImg, width: 130),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
