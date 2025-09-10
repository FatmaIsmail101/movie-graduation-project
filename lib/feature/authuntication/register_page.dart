import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/page_route_name.dart';

import '../../core/constants/assets.dart';
import '../../widgets/custom_text_form_field.dart';
import 'register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int selectedAvatar = 0;
  bool showPassword = false;
  bool showConfirmPassword = false;
  int selectedLang = 0;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  final Map<String, List<String>> localizedTexts = {
    'register': ['Register', 'تسجيل حساب جديد'],
    'name': ['Name', 'الاسم'],
    'email': ['Email', 'البريد الإلكتروني'],
    'password': ['Password', 'كلمة المرور'],
    'confirmPassword': ['Confirm Password', 'تأكيد كلمة المرور'],
    'phone': ['Phone Number', 'رقم الهاتف'],
    'createAccount': ['Create Account', 'انشاء حساب'],
    'alreadyHaveAccount': ['Already Have Account ?', 'عندك حساب بالفعل؟ '],
    'login': ['Login', 'دخول'],
    'avatar': ['Avatar', 'الصورة الرمزية'],
  };

  final List<Map<String, String>> avatars = [
    {'asset': AppAssets.image9, 'label': 'Avatar'},
    {'asset': AppAssets.image7, 'label': 'Avatar'},
    {'asset': AppAssets.image2, 'label': 'Avatar'},
    {'asset': AppAssets.image1, 'label': 'Avatar'},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(),
      child: Directionality(
        textDirection: selectedLang == 0 ? TextDirection.ltr : TextDirection
            .rtl,
        child: Scaffold(
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
              localizedTexts['register']![selectedLang],
              style: const TextStyle(
                color: Color(0xFFFFBB3B),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          body: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                // هنا بتعرفي الإيميل فورًا
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Registered Email: ${state.email}")),
                );
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              bool loading = state is RegisterLoading;
              String? error;
              if (state is RegisterFailure) error = state.error;
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: isSelected
                                          ? Border.all(
                                          color: Color(0xFFFFBB3B), width: 4)
                                          : null,
                                      boxShadow: isSelected
                                          ? [
                                        BoxShadow(
                                          color: Color(0xFFFFBB3B).withOpacity(
                                              0.25),
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
                                  const SizedBox(height: 12),
                                  if (isSelected)
                                    Text(
                                      localizedTexts['avatar']![selectedLang],
                                      style: const TextStyle(
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
                    _customField(
                      iconAsset: AppAssets.identificationIcn,
                      hint: localizedTexts['name']![selectedLang],
                      fontSize: 16,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 18),
                    _customField(
                      iconAsset: AppAssets.mailIcn,
                      hint: localizedTexts['email']![selectedLang],
                      fontSize: 16,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 18),
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      textEditingController: _passwordController,
                      prefixIcon: Icon(
                        Icons.enhanced_encryption,
                        color: Colors.white,
                      ),
                      text: "Password",
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Password";
                        }
                        final password = RegExp(
                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$',
                        );
                        if (password.hasMatch(value)) {
                          print("Strong Password");
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 18),
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      textEditingController: _confirmPasswordController,
                      prefixIcon: Icon(
                        Icons.enhanced_encryption,
                        color: Colors.white,
                      ),
                      text: "Re-Password",
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Password";
                        }
                        final password = RegExp(
                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$',
                        );
                        if (!password.hasMatch(value)) {
                          print("Strong Password");
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 18),
                    _customField(
                      iconAsset: AppAssets.phoneIcn,
                      hint: localizedTexts['phone']![selectedLang],
                      fontSize: 16,
                      controller: _phoneController,
                    ),
                    const SizedBox(height: 18),
                    if (error != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          error,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    if (loading)
                      const CircularProgressIndicator(),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: loading
                            ? null
                            : () {
                          BlocProvider.of<RegisterBloc>(context).add(
                            RegisterSubmitted(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                              phone: _phoneController.text,
                              avatarId: selectedAvatar + 1,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF6BD00),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: Text(
                          localizedTexts['createAccount']![selectedLang],
                          style: const TextStyle(
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
                        Text(
                          localizedTexts['alreadyHaveAccount']![selectedLang],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageRouteName.loginView);
                          },
                          child: Text(
                            localizedTexts['login']![selectedLang],
                            style: const TextStyle(
                              color: Color(0xFFF6BD00),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    _languageSwitcherCircle(),
                    const SizedBox(height: 18),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _languageSwitcherCircle() {
    const double switcherWidth = 108;
    const double switcherHeight = 54;
    const double flagRadius = 21;
    const double yellowCircleSize = 44;

    return Container(
      width: switcherWidth,
      height: switcherHeight,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        border: Border.all(color: Color(0xFFF6BD00), width: 2),
        borderRadius: BorderRadius.circular(90),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedAlign(
            alignment: selectedLang == 0 ? Alignment.centerLeft : Alignment
                .centerRight,
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeInOut,
            child: Container(
              width: yellowCircleSize,
              height: yellowCircleSize,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFF6BD00), width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF6BD00).withOpacity(0.18),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => setState(() => selectedLang = 0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: flagRadius,
                  child: ClipOval(
                    child: Image.asset(
                      AppAssets.en,
                      fit: BoxFit.cover,
                      width: flagRadius * 2,
                      height: flagRadius * 2,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => selectedLang = 1),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: flagRadius,
                  child: ClipOval(
                    child: Image.asset(
                      AppAssets.ar,
                      fit: BoxFit.cover,
                      width: flagRadius * 2,
                      height: flagRadius * 2,
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
    TextEditingController? controller,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
              controller: controller,
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
                    suffixAsset, width: 28, height: 28, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
