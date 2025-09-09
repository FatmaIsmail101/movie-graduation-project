import 'package:flutter/material.dart';

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
    {'asset': AppAssets.coolMan, 'label': 'Avatar'},
    {'asset': AppAssets.boyAvatar, 'label': 'Avatar'},
    {'asset': AppAssets.matureMan, 'label': 'Avatar'},
    {'asset': AppAssets.women, 'label': 'Avatar'},
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
        title: const Text(
          "Register",
          style: TextStyle(
            color: Color(0xFFFFBB3B),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // --- Avatar picker ---
            SizedBox(
              height: 170,
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: isSelected
                                  ? Border.all(
                                      color: Color(0xFFFFBB3B),
                                      width: 4,
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
                              radius: isSelected ? 55 : 40,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                avatars[index]['asset']!,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (isSelected)
                            const Text(
                              "Avatar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 14),
            // ------ INPUT FIELDS --------
            _customField(
              iconAsset: AppAssets.identificationIcn,
              hint: "Name",
              fontSize: 16,
            ),
            const SizedBox(height: 18),
            _customField(
              iconAsset: AppAssets.mailIcn,
              hint: "Email",
              fontSize: 16,
            ),
            const SizedBox(height: 18),
            _customField(
              iconAsset: AppAssets.passwordIcn,
              hint: "Password",
              isPassword: true,
              isObscure: !showPassword,
              onSuffixTap: () => setState(() => showPassword = !showPassword),
              suffixAsset: AppAssets.eyeOff,
              fontSize: 16,
            ),
            const SizedBox(height: 18),
            _customField(
              iconAsset: AppAssets.passwordIcn,
              hint: "Confirm Password",
              isPassword: true,
              isObscure: !showConfirmPassword,
              onSuffixTap: () =>
                  setState(() => showConfirmPassword = !showConfirmPassword),
              suffixAsset: AppAssets.eyeOff,
              fontSize: 16,
            ),
            const SizedBox(height: 18),
            _customField(
              iconAsset: AppAssets.phoneIcn,
              hint: "Phone Number",
              fontSize: 16,
            ),
            // -------- زر Create Account --------
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF6BD00),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Color(0xFF121312),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already Have Account ? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Go to Login page
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFFF6BD00),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            // -------- لغة السويتشر --------
            _languageSwitcherAnimated(),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  // ---------- لغة السويتشر ----------
  Widget _languageSwitcherAnimated() {
    // أبعاد صغيرة وثابتة
    const double totalWidth = 108; // قللت العرض الكلي عشان يلم الأعلام
    const double iconRadius = 21;
    const double borderWidth = 2;
    const double yellowCircleSize = 44;

    return Container(
      width: totalWidth,
      height: yellowCircleSize + 10,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        border: Border.all(color: Color(0xFFF6BD00), width: borderWidth),
        borderRadius: BorderRadius.circular(90),
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
                border: Border.all(color: Color(0xFFF6BD00), width: 3),
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
                        AppAssets.englishIcn,
                        fit: BoxFit.cover,
                        width: iconRadius * 2,
                        height: iconRadius * 2,
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
                        AppAssets.arabicIcn,
                        fit: BoxFit.cover,
                        width: iconRadius * 2,
                        height: iconRadius * 2,
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
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          if (iconAsset != null)
            Image.asset(iconAsset, width: 28, height: 28, color: Colors.white),
          const SizedBox(width: 16),
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
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Image.asset(
                  suffixAsset,
                  width: 28,
                  height: 28,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
