import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpia/gen/assets.gen.dart';
import 'package:mpia/src/core/utils/field_validation.dart';
import 'package:mpia/src/core/utils/ui_constants/app_colors.dart';
import 'package:mpia/src/core/utils/ui_constants/app_fonts.dart';
import 'package:mpia/src/core/utils/ui_constants/app_size.dart';
import 'package:mpia/src/core/widgets/common_button.dart';
import 'package:mpia/src/core/widgets/common_text.dart';
import 'package:mpia/src/core/widgets/common_text_field.dart';
import 'package:mpia/src/modules/auth/login/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: Form(
          key: controller.form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  Assets.images.imageLogin.path,
                  width: Get.width,
                  height: Get.height * 0.4,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 29),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CommonText(
                        text: 'Welcome back',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 8),
                      const CommonText(
                        text:
                            'Enter your email and password or login to you google account',
                        fontSize: 14,
                        color: AppTheme.grayColor,
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => Visibility(
                          visible: controller.errorMessage.value != null,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppSize.spaceSmall,
                            ),
                            child: Text(
                              controller.errorMessage.value ?? "",
                              style: AppFonts.redRegularTextStyle,
                            ),
                          ),
                        ),
                      ),
                      CommonTextField(
                        controller: controller.emailController,
                        text: 'Email',
                        hintText: 'Enter email',
                        prefixIcon: Icons.email,
                        validator: (value) => FieldValidation(value)
                            .isEmail()
                            .isRequired()
                            .validate(),
                      ),
                      const SizedBox(height: 23.5),
                      CommonTextField(
                        controller: controller.passwordController,
                        text: 'Password',
                        hintText: 'Enter password',
                        prefixIcon: Icons.person,
                        validator: (value) =>
                            FieldValidation(value).isRequired().validate(),
                      ),
                      const SizedBox(height: 39.5),
                      CommonButton(
                        onPressed: () {
                          controller.login();
                        },
                        text: 'Login',
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          controller.goToForgotPassword();
                        },
                        child: const CommonText(
                          text: 'Forgot Password?',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CommonText(
                            text: "Don't have an account",
                            fontSize: 14,
                          ),
                          InkWell(
                            onTap: () => controller.goToSignup(),
                            child: const CommonText(
                              text: ' Sign Up',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ],
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
