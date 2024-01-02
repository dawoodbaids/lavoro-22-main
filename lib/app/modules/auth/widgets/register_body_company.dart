// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, avoid_print
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:lavoro/app/modules/auth/controllers/register_controller_Company.dart';

import '../../../core/utils/helpers/custom_bottom_sheet.dart';

import '../../../core/utils/validators.dart';

import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_textformfield.dart';

class RegisterBodyCompany extends GetView<RegisterControllerCompany> {
  const RegisterBodyCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: Get.height * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PickUserImageWidget(
                    onChanged: (imagePath) => controller.imagePath = imagePath,
                  ),
                ],
              ),
              CustomTextFormField(
                controller: controller.companyNameController,
                label: 'Company Name',
                prefixIcon: const Icon(Icons.cabin),
                validator: CustomValidator.validateUsername,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: controller.cemailController,
                label: 'Email',
                autofillHints: const [AutofillHints.email],
                prefixIcon: const Icon(Icons.email),
                validator: CustomValidator.validateEmail,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: controller.jobDescriptionController,
                label: 'Description about the job',
                prefixIcon: const Icon(Icons.description),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  controller.isExpanded.value = !controller.isExpanded.value;
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
               child: Obx(
  () => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () {
          controller.isExpanded.value = !controller.isExpanded.value;
        },
        child: Container(
       
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Job Programming Languages :',
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                controller.isExpanded.value
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
              ),
            ],
          ),
        ),
      ),
      if (controller.isExpanded.value)
        Container(
       
         
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            spacing: 8.0,
            children: controller.cselectedLanguages.map((jobTitle) {
              return GestureDetector(
                onTap: () {
                  print('Job Title tapped: $jobTitle');
                  if (controller.cselectedLanguages.contains(jobTitle)) {
                    controller.cselectedLanguages.remove(jobTitle);
                  } else {
                    controller.cselectedLanguages.add(jobTitle);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: controller.cselectedLanguages.contains(jobTitle)
                          ? Colors.purple
                          : null,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      jobTitle,
                      style: TextStyle(
                        color: controller.cselectedLanguages.contains(jobTitle)
                            ? Colors.white
                            : null,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
    ],
  ),
),


                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(1.0),

                value: controller.selectedCountry2,
                onChanged: (value) {
                  controller.selectedCountry2 = value!;
                },
                items: controller.countries.map((country) {
                  return DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Country',
                  icon: Icon(Icons.location_on),
                ),
                // validator: CustomValidator.requiredCountry,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: controller.cphoneController,
                label: 'Phone Number',
                prefixIcon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
                validator: CustomValidator.validatePhoneNumber,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: controller.cpasswordController,
                label: 'Password',
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
                validator: CustomValidator.validatePassword,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: controller.cconfirmPasswordController,
                label: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock_reset),
                isPassword: true,
                validator: (value) => CustomValidator.confirmPassword(
                    value, controller.cpasswordController.text),
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    if (controller.cselectedLanguages.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please fill in all required fields',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }

                  await controller.signUp();
                },
                label: 'SignUp',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PickUserImageWidget extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  const PickUserImageWidget({super.key, this.onChanged});

  @override
  State<PickUserImageWidget> createState() => _PickUserImageWidgetState();
}

class _PickUserImageWidgetState extends State<PickUserImageWidget> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            height: 125,
            width: 125,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 5,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(150),
              child: image?.path != null
                  ? Image.file(
                      File(image!.path),
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.person, size: 100),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              height: 40,
              width: 29,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () async {
                  final res = await CustomBottomSheet.imagePiker();
                  if (res != null) {
                    setState(() => image = res);
                    widget.onChanged?.call(res.path);
                  }
                },
                child: const Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
