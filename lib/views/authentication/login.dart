import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vbacrypto_signal/core/constants/assets.dart';
import 'package:vbacrypto_signal/core/constants/routing_constants.dart';
import 'package:vbacrypto_signal/core/services/navigation_service.dart';
import 'package:vbacrypto_signal/core/utils/colors.dart';
import 'package:vbacrypto_signal/core/utils/text.dart';
import 'package:vbacrypto_signal/core/utils/text_style.dart';
import 'package:vbacrypto_signal/bloc/login_bloc/login_bloc.dart';
import 'package:vbacrypto_signal/widgets/app_button.dart';
import 'package:vbacrypto_signal/widgets/app_text_field.dart';
import 'package:vbacrypto_signal/widgets/loader_page.dart';
import 'package:vbacrypto_signal/widgets/vba_flush_bar.dart';

import '../../core/utils/validators.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    Future.wait([
      precacheImage(const AssetImage(ImageAssets.backgroundImage), context)
    ]);
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(listener: (context, state) {
          if (state is LoginError) {
            VbaFlushBar.showFailure(failure: state.failure);
            
          } else if (state is LoginSuccessful) {
            NavigationService.instance
                .navigateToReplaceAll(NavigatorRoutes.home);
          }
        }, child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            // if (state is LoginLoading) {
            //   busy = true;
            // }
            return LoaderPage(
              busy: state is LoginLoading,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 29,
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(SvgAssets.arrowBack),
                        AppText.heading("Log In"),
                        const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Form(
                              key: loginFormKey,
                              child: Container(
                                //height: 300,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: AppColors.secondaryColor),
                                child: Column(children: [
                                  AppTextField(
                                    title: "Email Address",
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) =>
                                        TextFieldValidators.email(value),
                                    hint: "you@example.com",
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  AppTextField(
                                    title: "Password",
                                    controller: passwordController,
                                    hint: "Not less than 8 characters",
                                    maxLines: 1,
                                    isPassword: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) =>
                                        TextFieldValidators.password(value),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  AppButton(
                                    text: "Log In",
                                    onPressed: () {
                                      if (loginFormKey.currentState!
                                          .validate()) {
                                        print("hello");
                                        BlocProvider.of<LoginBloc>(context).add(
                                            Login(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text));
                                      }
                                    },
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 24,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      // width: (MediaQuery.sizeOf(context).width * 28) /
                                      //     100,
                                      height: 1,
                                      color: AppColors.secondaryColor,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    AppText.body2(
                                      "OR",
                                      color: AppColors.hintTextColor,
                                      // height: 22.40,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      // width: (MediaQuery.sizeOf(context).width * 28) /
                                      //     100,
                                      width: 100,
                                      height: 1,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(SvgAssets.google),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    SvgPicture.asset(SvgAssets.apple)
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: 181,
                                  child: Text.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                        text: "Don’t have an account?",
                                        style: AppTextStyle.textButton.copyWith(
                                            color: AppColors.hintTextColor),
                                      ),
                                      TextSpan(
                                        text: " Sign up",
                                        style: AppTextStyle.textButton.copyWith(
                                            color: AppColors.buttonColor),
                                      ),
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
