import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/assets.dart';

class UpdateProfileView extends StatefulWidget {
  final String? name;
  final String? phone;
  final int? avatarIndex;
  const UpdateProfileView({
    super.key,
    this.name,
    this.phone,
    this.avatarIndex,
  });

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  late int selectedAvatarIndex;
  late TextEditingController nameController;
  late TextEditingController phoneController;
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

  @override
  void initState() {
    super.initState();
    selectedAvatarIndex = widget.avatarIndex ?? 0;
    nameController = TextEditingController(text: widget.name ?? "John Safwat");
    phoneController = TextEditingController(text: widget.phone ?? "01200000000");
  }

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF232323),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.all(20.r),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: avatars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
          ),
          itemBuilder: (context, idx) {
            final isSelected = selectedAvatarIndex == idx;
            return GestureDetector(
              onTap: () {
                setState(() => selectedAvatarIndex = idx);
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? const Color(0xFFF6BD00) : Colors.grey.shade700,
                    width: isSelected ? 3 : 1.5,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(avatars[idx]),
                  radius: 34.r,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121312),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF6BD00)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pick Avatar",
          style: TextStyle(
            color: Color(0xFFF6BD00),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 420),
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar - on tap shows bottom sheet
              GestureDetector(
                onTap: _showAvatarPicker,
                child: CircleAvatar(
                  radius: 54.r,
                  backgroundImage: AssetImage(avatars[selectedAvatarIndex]),
                ),
              ),
              SizedBox(height: 22.h),
              // Name Field
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: Colors.white),
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.grey[300]),
                  filled: true,
                  fillColor: const Color(0xFF232323),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              SizedBox(height: 12.h),
              // Phone Field
              TextField(
                controller: phoneController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone, color: Colors.white),
                  hintText: "Phone",
                  hintStyle: TextStyle(color: Colors.grey[300]),
                  filled: true,
                  fillColor: const Color(0xFF232323),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              SizedBox(height: 12.h),
              // Reset password
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              const Spacer(),
              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF6BD00),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.pop(context, {
                      'name': nameController.text,
                      'phone': phoneController.text,
                      'avatarIndex': selectedAvatarIndex,
                    });
                  },
                  child: const Text(
                    "Update Data",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
