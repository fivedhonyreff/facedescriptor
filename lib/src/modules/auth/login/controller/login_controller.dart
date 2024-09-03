import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpia/src/core/abstract/base_controller.dart';
import 'package:mpia/src/core/di/injector.dart';
import 'package:mpia/src/core/domain/schema/auth/login_schema.dart';
import 'package:mpia/src/core/domain/usecase/auth/login_usecase.dart';

class LoginController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rxn<String> errorMessage = Rxn<String>();
  final _loginUsecase = injector<LoginUsecase>();

  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController.text = "andiputra@gmail.com";
    passwordController.text = "Andi150310";
    super.onInit();
  }

  void goToSignup() {
    // Get.toNamed(Routes.signUpChooseRole);
  }

  void goToDashboard() {
    // Get.offAllNamed(Routes.dashboard);
  }

  void goToFirstChangePassword() {
    // Get.toNamed(Routes.firstChangePassword);
  }

  void goToForgotPassword() {
    // Get.toNamed(Routes.forgotPassword);
  }

  void login() async {
    if (form.currentState!.validate()) {
      showLoading();
      errorMessage.value = null;
      final schema = LoginSchema(
        email: emailController.text,
        password: passwordController.text,
      );
      final result = await _loginUsecase(schema);
      hideLoading();
      result.fold(
        (l) {
          errorMessage.value = l.message;
        },
        (r) {
          if (r.data.verified == true) {
            toastSuccess(title: "Success", message: "Berhasil Login");
            goToDashboard();
          } else {
            goToFirstChangePassword();
          }
        },
      );
    } else {
      return;
    }
  }
}
