import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constants/assets.dart';
import 'package:movies/core/theme/color_pallete.dart';
import 'package:movies/feature/authuntication/data/data_source/di.dart';
import 'package:movies/feature/update_profile/presintation/bloc/update_profile_bloc.dart';
import 'package:movies/feature/update_profile/presintation/screens/widgets/avatar_menu.dart';
import 'package:movies/widgets/custom_button.dart';
import 'package:movies/widgets/custom_text_form_field.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final List<String> avatars = [
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

  int? selectedAvatar;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  void _pickeAvatar() {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorPallete.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: avatars.length,
            itemBuilder: (context, index) {
              return AvatarMenu(
                avatarPath: avatars[index],
                isSelected: selectedAvatar == index,
                onTap: () {
                  setState(() {
                    selectedAvatar = index;
                  });
                  Navigator.pop(context);
                },
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
        body: BlocProvider(
          create: (BuildContext context) => getIt<UpdateProfileBloc>(),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Form(
              key: _globalKey,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
                  listener: (context, state) {
                    if (state.updateRequestState == RequestState.success) {
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Bounceable(
                            onTap: _pickeAvatar,
                            child: CircleAvatar(
                              radius: 60.r,
                              backgroundImage: selectedAvatar != null
                                  ? AssetImage(avatars[selectedAvatar!])
                                  : null,
                              child: selectedAvatar == null
                                  ? const Icon(Icons.person, size: 50)
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(height: 35.h),
                        CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Name";
                            }
                            final RegExp name = RegExp('[a-zA-Z]');

                            if (!name.hasMatch(value)) {
                              return "Invalid Name";
                            }
                            return null;
                          },
                          textEditingController: _nameController,
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                          text: "Name",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your number";
                            }
                            final RegExp name = RegExp(r'^[0-9]{10,15}$');
                            if (!name.hasMatch(value)) {
                              return "Invalid number";
                            }
                            return null;
                          },
                          textEditingController: _phoneController,
                          prefixIcon: Icon(Icons.phone, color: Colors.white),
                          text: "012254885505",
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          "Reset Password",
                          style: theme.textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 160.h),
                        CustomButton(
                          text: "Delete Account",
                          color: Colors.red,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: 20.h),
                        CustomButton(
                          text: "Update Data",
                          color: ColorPallete.primaryColor,
                          onTap: () {
                            if (_globalKey.currentState!.validate()) {
                              //todo:
                              BlocProvider.of<UpdateProfileBloc>(context).add(
                                UpdateBtnEvent(
                                  phone: _phoneController.text,
                                  name: _nameController.text,
                                  avaterId: selectedAvatar,
                                  email: _emailController.text,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
