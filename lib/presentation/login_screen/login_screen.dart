import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:vishwas_s_application1/core/app_export.dart';
import 'package:vishwas_s_application1/core/utils/validation_functions.dart';
import 'package:vishwas_s_application1/widgets/custom_elevated_button.dart';
import 'package:vishwas_s_application1/widgets/custom_outlined_button.dart';
import 'package:vishwas_s_application1/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState(
        loginModelObj: LoginModel(),
      ))
        ..add(LoginInitialEvent()),
      child: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onError,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 24.h,
              right: 24.h,
              bottom: 152.v,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                _buildSignInButton(context),
                SizedBox(height: 31.v),
                _buildEmailField(context),
                SizedBox(height: 16.v),
                _buildPasswordField(context),
                SizedBox(height: 24.v),
                _buildSignInButton2(context),
                SizedBox(height: 40.v),
                Text(
                  "msg_forgot_your_login".tr,
                  style: CustomTextStyles.bodyMediumOnPrimaryContainer,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildCreateAccountButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildSignInButton(BuildContext context) {
    return CustomElevatedButton(
      height: 33.v,
      text: "lbl_sign_in".tr,
      buttonStyle: CustomButtonStyles.none,
      buttonTextStyle: CustomTextStyles.robotoOnPrimaryContainer,
    );
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, TextEditingController?>(
      selector: (state) => state.emailFieldController,
      builder: (context, emailFieldController) {
        return CustomTextFormField(
          controller: emailFieldController,
          hintText: "lbl_email".tr,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, TextEditingController?>(
      selector: (state) => state.passwordFieldController,
      builder: (context, passwordFieldController) {
        return CustomTextFormField(
          controller: passwordFieldController,
          hintText: "lbl_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildSignInButton2(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_sign_in2".tr,
      buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
      buttonTextStyle: CustomTextStyles.bodyLargeBlack900,
    );
  }

  /// Section Widget
  Widget _buildCreateAccountButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "lbl_create_account".tr,
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 40.v,
      ),
    );
  }
}
