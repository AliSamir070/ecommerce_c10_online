import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef validator = String? Function(String?);
class CustomFormField extends StatelessWidget {
  String title;
  TextEditingController controller;
  TextInputType keyboard;
  int? maxLength;
  bool isObscured;
  validator validation;
  String hint;
  CustomFormField({super.key,required this.hint,required this.validation, this.isObscured = false,this.maxLength,required this.title,required this.controller,required this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 24.h,),
        TextFormField(
          controller:controller ,
          style: Theme.of(context).textTheme.titleSmall,
          keyboardType: keyboard,
          maxLength:maxLength ,
          obscureText:isObscured ,
          validator: validation,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.black.withOpacity(0.7)
            ),
            hintText: hint,
            fillColor: Colors.white,
            filled: true
          ),
        )
      ],
    );
  }
}
