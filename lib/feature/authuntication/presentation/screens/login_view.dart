import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constants/assets.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/core/theme/color_pallete.dart';
import 'package:movies/widgets/custom_button.dart';

import '../../../../widgets/custom_text_form_field.dart';
import '../../data/data_source/di.dart';
import '../bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailTextEditingController =
      TextEditingController();

  final TextEditingController passwordTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String emailText = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<LoginBloc>(),
          child: Padding(
            padding: const EdgeInsets.all(16).r,
            child: SingleChildScrollView(
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  print("Current state: ${state.loginRequestState}");

                  if (state.loginRequestState == RequestState.success) {
                    Navigator.pushNamed(
                      context,
                      PageRouteName.uptadeProfileView,
                    );
                  }
                },

                builder: (context, state) {
                  return Form(
                    key: _globalKey,
                    child: Column(
                      spacing: 23.h,
                      children: [
                        Image.asset(
                          AppAssets.loginPIC,
                          height: 118.h,
                          width: 121.w,
                        ),
                        CustomTextFormField(
                          textInputType: TextInputType.emailAddress,
                          textEditingController: emailTextEditingController,
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                          text: "Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Email";
                            }
                            final emailRegExp = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
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
                          textEditingController: passwordTextEditingController,
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(color: Color(0xffF6BD00)),
                          ),
                        ),
                        CustomButton(
                          text: "Login",
                          color: ColorPallete.primaryColor,
                          onTap: () {
                            if (_globalKey.currentState!.validate()) {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginBtnEvent(
                                  emailTextEditingController.text,
                                  passwordTextEditingController.text,
                                ),
                              );

                              // handleLogin
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t Have Account ?  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Create One",
                              style: TextStyle(
                                color: Color(0xffF6BD00),
                                fontSize: 14.sp,
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
                                endIndent: 20.w,
                                indent: 20.w,
                                thickness: 2.h,
                              ),
                            ),
                            Text(
                              "Or",
                              style: TextStyle(color: Color(0xffF6BD00)),
                            ),
                            Expanded(
                              child: Divider(
                                color: ColorPallete.primaryColor,
                                endIndent: 20.w,
                                indent: 20.w,
                                thickness: 2.h,
                              ),
                            ),
                          ],
                        ),

                        CustomButton(
                          text: "Login With Google",
                          color: ColorPallete.primaryColor,
                        ),
                        Container(
                          width: 70.w,
                          height: 31.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF6BD00),
                              width: 3.w,
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
                                      color: ColorPallete.primaryColor,
                                      width: 3
                                          .r, //style: context.locale.toString()=="en"?
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
                                      width: 3
                                          .r, //style: //context.locale.toString()=="ar"?
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
