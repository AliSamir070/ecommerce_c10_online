import 'package:ecommerce_c10_online/core/DI/di.dart';
import 'package:ecommerce_c10_online/core/constants.dart';
import 'package:ecommerce_c10_online/core/resuable_components/custom_button.dart';
import 'package:ecommerce_c10_online/core/resuable_components/custom_form_field.dart';
import 'package:ecommerce_c10_online/core/utils/routes_manager.dart';
import 'package:ecommerce_c10_online/presentation/login/view_model/LoginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/local/PrefsHelper.dart';
import '../../core/utils/assets_manager.dart';
import '../../core/utils/strings_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginViewModel>(),
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AssetsManager.route,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      height: 71.h,
                      width: 237.w,
                    ),
                  ),
                  SizedBox(
                    height: 86.h,
                  ),
                  Text(
                    StringsManager.welcomeMessage,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    StringsManager.pleaseSignIn,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomFormField(
                      hint: StringsManager.emailHint,
                      validation: (value) {
                        if (!Constants.emailRegex.hasMatch(value!)) {
                          return StringsManager.emailNotValid;
                        }
                        return null;
                      },
                      title: StringsManager.emailTitle,
                      controller: emailController,
                      keyboard: TextInputType.emailAddress),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomFormField(
                    hint: StringsManager.passwordHint,
                    validation: (value) {
                      if (value!.length < 8) {
                        return StringsManager.weakPassword;
                      }
                      return null;
                    },
                    title: StringsManager.passwordTitle,
                    controller: passwordController,
                    keyboard: TextInputType.visiblePassword,
                    isObscured: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      StringsManager.forgotPass,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<LoginViewModel, LoginStates>(
                      listener: (context, state) {
                        if(state is LoginSuccessState){
                          PrefsHelper.saveToken(state.authEntity.token??"");
                          Fluttertoast.showToast(
                              msg: "Logged in successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Navigator.pushNamedAndRemoveUntil(context, RoutesManager.homeRouteName, (route) => false);
                        }
                        if(state is LoginErrorState){
                          Fluttertoast.showToast(
                              msg: state.error,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      builder: (context, state) {
                        if(state is LoginLoadingState){
                          return Center(child: CircularProgressIndicator(
                            color: Colors.white,
                          ),);
                        }
                        return CustomButton(
                            title: StringsManager.login,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginViewModel.get(context).SignIn(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            });
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RoutesManager.registerRouteName);
                      },
                      child: Text(
                        StringsManager.dontHaveAccount,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 18.sp, fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
