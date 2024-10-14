import 'package:flutter/material.dart';
import 'package:notes/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function() ontap;
  const CustomButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        // height: 20,
        // width: 20,
        child: const Padding(
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
