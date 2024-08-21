import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/profile_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/screens/profile/edit_profile/widget/edit_profile_text_field.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ProfileController>(builder: (controller) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 60),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(text: "Name"),
                      EditProfileTextField(
                        controller: controller.nameCon,
                        hintText: 'Enter Name',
                      ),
                      const SizedBox(height: 5),
                      const CustomText(text: "Date of Birth"),
                      SizedBox(
                        height: 35,
                        child: TextField(
                          controller: controller.dobCon,
                          onTap: () {
                            controller.datePicker(context);
                          },
                          cursorColor: MyTheme.mainColor,
                          cursorHeight: 20,
                          readOnly: true,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.edit,
                              color: MyTheme.mainColor,
                            ),
                            hintText: "Enter Date of birth",
                            hintStyle: TextStyle(
                                fontSize: 15, color: MyTheme.grey_153),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const CustomText(text: "Gender"),
                      SizedBox(
                        height: 40,
                        child: DropdownButtonFormField(
                          value: controller.selectedGender,
                          icon: const SizedBox(),
                          onChanged: controller.onChangeGenderType,
                          items: controller.genderType.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.edit,
                              color: MyTheme.mainColor,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Select Gender",
                            hintStyle: TextStyle(color: MyTheme.grey_153),
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const CustomText(text: "City"),
                      EditProfileTextField(
                        controller: controller.cityCon,
                        hintText: 'Enter City',
                      ),
                      const SizedBox(height: 5),
                      const CustomText(text: "Pincode"),
                      EditProfileTextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: controller.pincodeCon,
                        hintText: 'Enter Pincode',
                      ),
                      const SizedBox(height: 5),
                      const CustomText(text: "District"),
                      EditProfileTextField(
                        controller: controller.districtCon,
                        hintText: 'Enter District',
                      ),
                      const SizedBox(height: 5),
                      const CustomText(text: "State"),
                      EditProfileTextField(
                        controller: controller.stateCon,
                        hintText: 'Enter State',
                      ),
                      const SizedBox(height: 5),
                      const CustomText(text: "Country"),
                      EditProfileTextField(
                        controller: controller.countryCon,
                        hintText: 'Enter Country',
                      ),
                      const SizedBox(height: 5),
                      controller.userData!.user!.kyc != null
                          ? Wrap(
                              children: [
                                const CustomText(text: "Email Address"),
                                EditProfileTextField(
                                  readOnly: true,
                                  hintText:
                                      controller.userData!.user!.email ?? '',
                                ),
                                const SizedBox(height: 5),
                                const CustomText(text: "Aadhaar Number"),
                                EditProfileTextField(
                                  readOnly: true,
                                  hintText: controller
                                          .userData!.user!.kyc!.aadharNumber ??
                                      '',
                                ),
                                const SizedBox(height: 5),
                                const CustomText(text: "Pan Number"),
                                EditProfileTextField(
                                  readOnly: true,
                                  hintText: controller
                                          .userData!.user!.kyc!.panNumber ??
                                      '',
                                ),
                                const SizedBox(height: 5),
                                const CustomText(text: "Bank Account Number"),
                                EditProfileTextField(
                                  readOnly: true,
                                  hintText: controller
                                          .userData!.user!.kyc!.accountNumber ??
                                      '',
                                ),
                                const SizedBox(height: 5),
                                const CustomText(text: "IFSC Code"),
                                EditProfileTextField(
                                  readOnly: true,
                                  hintText: controller
                                          .userData!.user!.kyc!.ifscCode ??
                                      '',
                                ),
                              ],
                            )
                          : const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GetBuilder<ProfileController>(
                            builder: (controller) {
                          return CustomButton(
                            loading: controller.editProfileLoadingState,
                            onTap: () => controller.editProfile(),
                            text: "Edit Profile",
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -70,
              left: (MediaQuery.of(context).size.width / 2) - 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circle Container for Profile Image
                  GetBuilder<ProfileController>(builder: (controller) {
                    return Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: controller.selectedImage != null
                              ? FileImage(controller.selectedImage!)
                              : const AssetImage("assets/icon/profile_icon.png")
                                  as ImageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
                  // Positioned(
                  //   bottom: 6,
                  //   right: 10,
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       controller.pickImage();
                  //     },
                  //     child: const Icon(
                  //       Icons.camera_alt,
                  //       color: MyTheme.mainColor,
                  //       size: 24,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
