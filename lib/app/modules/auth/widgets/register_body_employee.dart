// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, avoid_print
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import '../../../core/utils/helpers/custom_bottom_sheet.dart';

import '../../../core/utils/validators.dart';

import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_textformfield.dart';
import '../controllers/register_controller_employee.dart';

class RegisterBodyEmployee extends GetView<RegisterControllerEmployee> {
  const RegisterBodyEmployee({super.key});

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
                controller: controller.employeeNameController,
                label: 'Name',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: controller.emailController,
                label: 'Email',
                autofillHints: const [AutofillHints.email],
                prefixIcon: const Icon(Icons.email),
                validator: CustomValidator.validateEmail,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: controller.descriptionController,
                label: 'Description about your experiences',
                prefixIcon: const Icon(Icons.description),
              ),
              const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
  borderRadius: BorderRadius.circular(18.0),
  value: controller.selectedExperience,
  onChanged: (value) {
    controller.selectedExperience = value!;
  },
  items: controller.experiences.map((experience) {
    return DropdownMenuItem(
      value: experience,
      child: Text(experience),
    );
  }).toList(),
  decoration: const InputDecoration(
    labelText: 'Experience',
    icon: Icon(Icons.format_list_numbered_sharp),
  ),
  // Add a validator if needed
),const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  controller.isExpanded.value = !controller.isExpanded.value;
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(4.0),
                  
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.isExpanded.value =
                                !controller.isExpanded.value;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.purple),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Programming Languages :',
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
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.purple),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              spacing: 8.0,
                              children:
                                  controller.languageOptions.map((language) {
                                return GestureDetector(
                                  onTap: () {
                                    print('Language tapped: $language');
                                    if (controller.selectedLanguages
                                        .contains(language)) {
                                      controller.selectedLanguages
                                          .remove(language);
                                    } else {
                                      controller.selectedLanguages
                                          .add(language);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: controller.selectedLanguages
                                                .contains(language)
                                            ? Colors.purple
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text(
                                        language,
                                        style: TextStyle(
                                          color: controller.selectedLanguages
                                                  .contains(language)
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
  const SizedBox(height: 20),
  
              DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(18.0),

                value: controller.selectedCountry,
                onChanged: (value) {
                  controller.selectedCountry = value!;
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
             
           
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.phoneController,
                label: 'Phone Number',
                prefixIcon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
                validator: CustomValidator.validatePhoneNumber,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: controller.passwordController,
                label: 'Password',
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
                validator: CustomValidator.validatePassword,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: controller.confirmPasswordController,
                label: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
                validator: (value) => CustomValidator.confirmPassword(
                    value, controller.passwordController.text),
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    if (controller.selectedLanguages.isEmpty) {
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
