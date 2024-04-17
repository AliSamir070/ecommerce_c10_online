import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  String title;
  void Function() onPressed;
  CustomButton({super.key,required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r)
          )
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 20.sp,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600
          ),
        ));
  }
}
