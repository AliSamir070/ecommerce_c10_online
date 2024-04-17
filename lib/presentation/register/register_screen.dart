import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants.dart';
import '../../core/resuable_components/custom_button.dart';
import '../../core/resuable_components/custom_form_field.dart';
import '../../core/utils/assets_manager.dart';
import '../../core/utils/routes_manager.dart';
import '../../core/utils/strings_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  late TextEditingController mobileController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    mobileController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    mobileController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
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
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: 71.h,
                    width: 237.w,
                  ),
                ),
                SizedBox(
                  height: 47.h,
                ),
                CustomFormField(
                    hint: StringsManager.fullNameHint,
                    validation: (value){
                      if(value!.isEmpty){
                        return StringsManager.nameCantBeEmpty;
                      }
                    },
                    title: StringsManager.fullNameTitle,
                    controller: fullNameController,
                    keyboard: TextInputType.name),
                SizedBox(
                  height: 32.h,
                ),
                CustomFormField(
                    hint: StringsManager.mobileHint,
                    validation: (value){
                      if(value!.length<11){
                        return StringsManager.notValidPhone;
                      }
                      return null;
                    },
                    maxLength: 11,
                    title: StringsManager.mobileTitle,
                    controller: mobileController,
                    keyboard: TextInputType.phone
                ),
                SizedBox(
                  height: 32.h,
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
                SizedBox(
                  height: 56.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      title: StringsManager.signup,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
