import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/assets.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/widgets/custom_button.dart';

import '../../widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final GlobalKey<FormState>_globalKey = GlobalKey<FormState>();
  String emailText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282A28),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              spacing: 23,
              children: [
                SvgPicture.asset(AppAssets.loginPIC),
                CustomTextFormField(
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailTextEditingController,
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  text: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Email";
                    }
                    final emailRegExp = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegExp.hasMatch(value)) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    emailText = value;
                  },
                ),
                CustomTextFormField(
                  textInputType: TextInputType.visiblePassword,
                  textEditingController: _passwordTextEditingController,
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
                        r'^(?=.[A-Z])(?=.[a-z])(?=.*[0-9]).{8,}$');
                    if (password.hasMatch(value)) {
                      print("Strong Password");
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(color: Color(0xffF6BD00)),
                  ),
                ),
                CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.homeView);
                    },
                    text: "Login", size: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t Have Account ?  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Create One",
                      style: TextStyle(
                        color: Color(0xffF6BD00),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xffF6BD00),
                        endIndent: 20,
                        indent: 20,
                        thickness: 2,
                      ),
                    ),
                    Text("Or", style: TextStyle(color: Color(0xffF6BD00))),
                    Expanded(
                      child: Divider(
                        color: Color(0xffF6BD00),
                        endIndent: 20,
                        indent: 20,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                //todo:SVG
                CustomButton(text: "Login With Google", size: 16,

                ),
                Container(
                  width: 70.w,
                  height: 31.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffF6BD00),
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Row(
                    children: [
                      Bounceable(
                        onTap: () {
                          //context.setLocale(Locale('en'));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF6BD00),
                              width:
                              3.r, //style: context.locale.toString()=="en"?
                              // BorderStyle.solid:BorderStyle.none
                            ),
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                          child: Image.asset(AppAssets.en),
                        ),
                      ),
                      Spacer(),
                      Bounceable(
                        onTap: () {
                          // context.setLocale(Locale('ar'));
                        },
                        child: Container(
                          width: 30.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF6BD00),
                              width:
                              3.r, //style: //context.locale.toString()=="ar"?
                              // BorderStyle.solid:BorderStyle.none
                            ),
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                          child: Image.asset(AppAssets.ar),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
