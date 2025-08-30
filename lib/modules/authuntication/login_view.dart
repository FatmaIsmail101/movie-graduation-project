import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/assets.dart';
import 'package:movies/widgets/custom_button.dart';

import '../../widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282A28),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 23,
            children: [
              SvgPicture.asset(AppAssets.loginPIC),
              CustomTextFormField(
                prefixIcon: Icon(Icons.email, color: Colors.white),
                text: "Email",
              ),
              CustomTextFormField(
                prefixIcon: Icon(
                  Icons.enhanced_encryption,
                  color: Colors.white,
                ),
                text: "Password",
                isPassword: true,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(color: Color(0xffF6BD00)),
                ),
              ),
              CustomButton(text: "Login", size: 20),
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
              CustomButton(text: "Login With Google", size: 16),
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
    );
  }
}
