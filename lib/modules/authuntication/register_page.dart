import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/assets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int selectedAvatar = 0;
  bool showPassword = false;
  bool showConfirmPassword = false;
  int selectedLang = 0; // 0: English, 1: Arabic

  final List<Map<String, String>> avatars = [
    {'asset': AppAssets.image9, 'label': 'Avatar'},
    {'asset': AppAssets.image7, 'label': 'Avatar'},
    {'asset': AppAssets.image2, 'label': 'Avatar'},
    {'asset': AppAssets.image10, 'label': 'Avatar'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFBB3B)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Register",
          style: TextStyle(
            color: Color(0xFFFFBB3B),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14.h),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            // --- Avatar picker ---
            SizedBox(
              height: 170.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedAvatar == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAvatar = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.r),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: isSelected
                                    ? Border.all(
                                  color: Color(0xFFFFBB3B),
                                  width: 4.w,
                                )
                                    : null,
                                boxShadow: isSelected
                                    ? [
                                  BoxShadow(
                                    color: Color(
                                      0xFFFFBB3B,
                                    ).withOpacity(0.25),
                                    blurRadius: 16,
                                    spreadRadius: 2,
                                  ),
                                ]
                                    : [],
                              ),
                              child: CircleAvatar(
                                radius: isSelected ? 55.r : 40.r,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  avatars[index]['asset']!,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            if (isSelected)
                              Text(
                                "Avatar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 14.h),
            // ------ INPUT FIELDS --------
            _customField(
              iconAsset: AppAssets.identificationIcn,
              hint: "Name",
              fontSize: 16.sp,
            ),
            SizedBox(height: 18.h),
            _customField(
              iconAsset: AppAssets.mailIcn,
              hint: "Email",
              fontSize: 16.sp,
            ),
            SizedBox(height: 18.h),
            _customField(
              iconAsset: AppAssets.passwordIcn,
              hint: "Password",
              isPassword: true,
              isObscure: !showPassword,
              onSuffixTap: () => setState(() => showPassword = !showPassword),
              suffixAsset: AppAssets.eyeOff,
              fontSize: 16.sp,
            ),
            SizedBox(height: 18.h),
            _customField(
              iconAsset: AppAssets.passwordIcn,
              hint: "Confirm Password",
              isPassword: true,
              isObscure: !showConfirmPassword,
              onSuffixTap: () =>
                  setState(() => showConfirmPassword = !showConfirmPassword),
              suffixAsset: AppAssets.eyeOff,
              fontSize: 16.sp,
            ),
            SizedBox(height: 18.h),
            _customField(
              iconAsset: AppAssets.phoneIcn,
              hint: "Phone Number",
              fontSize: 16.sp,
            ),
            // -------- زر Create Account --------
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF6BD00),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.r),
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Color(0xFF121312),
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have Account ? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Go to Login page
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFFF6BD00),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            // -------- لغة السويتشر --------
            _languageSwitcherAnimated(),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }

  // ---------- لغة السويتشر ----------
  Widget _languageSwitcherAnimated() {
    // أبعاد صغيرة وثابتة
    double totalWidth = 108.w; // قللت العرض الكلي عشان يلم الأعلام
    double iconRadius = 21.r;
    double borderWidth = 2.w;
    const double yellowCircleSize = 44;

    return Container(
      width: totalWidth,
      height: yellowCircleSize + 10.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        border: Border.all(color: Color(0xFFF6BD00), width: borderWidth),
        borderRadius: BorderRadius.circular(90.r),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // الدائرة الصفراء تتحرك يمين/شمال بس
          AnimatedAlign(
            alignment: selectedLang == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 0), // صفر
              width: yellowCircleSize,
              height: yellowCircleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFF6BD00), width: 3.w),
              ),
            ),
          ),
          // الأعلام
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => setState(() => selectedLang = 0),
                child: Container(
                  margin: EdgeInsets.only(left: 0), // لازق في الحافة
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: iconRadius,
                    child: ClipOval(
                      child: Image.asset(
                        AppAssets.en,
                        fit: BoxFit.cover,
                        width: iconRadius * 2.w,
                        height: iconRadius * 2.w,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => selectedLang = 1),
                child: Container(
                  margin: EdgeInsets.only(right: 0), // لازق في الحافة
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: iconRadius,
                    child: ClipOval(
                      child: Image.asset(
                        AppAssets.ar,
                        fit: BoxFit.cover,
                        width: iconRadius * 2.w,
                        height: iconRadius * 2.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customField({
    String? iconAsset,
    required String hint,
    double fontSize = 16,
    bool isPassword = false,
    bool isObscure = false,
    VoidCallback? onSuffixTap,
    String? suffixAsset,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF282A28),
        borderRadius: BorderRadius.circular(22.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Row(
        children: [
          if (iconAsset != null)
            Image.asset(
                iconAsset, width: 28.w, height: 28.h, color: Colors.white),
          SizedBox(width: 16.w),
          Expanded(
            child: TextField(
              obscureText: isObscure,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.82),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          if (isPassword && suffixAsset != null)
            GestureDetector(
              onTap: onSuffixTap,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.r),
                child: Image.asset(
                  suffixAsset,
                  width: 28.w,
                  height: 28.h,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
