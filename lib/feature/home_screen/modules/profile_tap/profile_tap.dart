 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constants/assets.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/core/theme/color_pallete.dart';
import 'package:movies/widgets/custom_button.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final String userName = "John Safwat";
  final int wishListCount = 12;
  final int historyCount = 10;

  int selectedAvatarIndex = 1;

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

  void _pickAvatar() {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorPallete.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(16.r),
          child: GridView.builder(
            itemCount: avatars.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final isSelected = index == selectedAvatarIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatarIndex = index;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border.all(color: Colors.yellow, width: 3)
                        : null,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatars[index]),
                    radius: 40.r,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: _pickAvatar,
                        child: CircleAvatar(
                          radius: 40.r,
                          backgroundImage: AssetImage(
                            avatars[selectedAvatarIndex],
                          ),
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

                  // Wish List & History
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
                            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
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
                            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
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
                      color: ColorPallete.primaryColor,
                      onTap: () {
                        // TODO: Add navigation to edit profile
                        Navigator.pushNamed(context, PageRouteName.uptadeProfileView);
                      },
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Column(
                    children: [
                      Icon(Icons.list, color: Colors.yellow, size: 30),
                      Text("Watch List", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.folder, color: Colors.yellow, size: 30),
                      Text("History", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50.h),

              Expanded(child: Center(child: Image.asset(AppAssets.popCornImg))),
            ],
          ),
        ),
      ),
    );
  }
}
