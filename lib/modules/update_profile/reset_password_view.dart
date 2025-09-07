import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/assets.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/core/theme/color_pallete.dart';
import 'package:movies/network/api_request.dart';
import 'package:movies/widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class ResetPasswordView extends StatefulWidget {
ResetPasswordView({super.key});

@override
State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {


  final TextEditingController _oldPasswordTextEditingController = TextEditingController();
  final TextEditingController _newPasswordTextEditingController = TextEditingController();

  final GlobalKey<FormState>_globalKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> handleResetPassword() async {
    setState(() {
      isLoading = true;
    });
    final response = await ApiRequests.resetPassword(
        _oldPasswordTextEditingController.text.trim(),
        _newPasswordTextEditingController.text.trim()
    );
    setState(() {
      isLoading = false;
    });
    if (response != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("reset password Success")));

      Navigator.pushReplacementNamed(context, PageRouteName.updateProfileView);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Reset Password Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              spacing: 23.h,
              children: [
                SvgPicture.asset(
                  AppAssets.loginPIC, height: 100.h, width: 100.w,),

                CustomTextFormField(
                  textInputType: TextInputType.visiblePassword,
                  textEditingController: _oldPasswordTextEditingController,
                  prefixIcon: Icon(
                    Icons.enhanced_encryption,
                    color: Colors.white,
                  ),
                  text: "Old Password",
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Old Password";
                    }
                    final password = RegExp(
                        r'^(?=.[A-Z])(?=.[a-z])(?=.*[0-9]).{8,}$');
                    if (password.hasMatch(value)) {
                      print("Strong Password");
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  textInputType: TextInputType.visiblePassword,
                  textEditingController: _newPasswordTextEditingController,
                  prefixIcon: Icon(
                    Icons.enhanced_encryption,
                    color: Colors.white,
                  ),
                  text: "New Password",
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter New Password";
                    }
                    final password = RegExp(
                        r'^(?=.[A-Z])(?=.[a-z])(?=.*[0-9]).{8,}$');
                    if (password.hasMatch(value)) {
                      print("Strong Password");
                    }
                    return null;
                  },
                ),


                CustomButton(
                  text: "Reset Password", color: ColorPallete.primaryColor,
                  onTap:
                  handleResetPassword

                  ,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
