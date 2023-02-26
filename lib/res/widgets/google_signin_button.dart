import 'package:flutter/material.dart';
import 'package:social_media/res/color.dart';
import 'package:social_media/res/images.dart';

class GoogleSigninButton extends StatelessWidget {
  const GoogleSigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        // color: AppColors.grayColor,
        gradient: const LinearGradient(
          colors: [
            AppColors.lightGrayColor,
            AppColors.primaryColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(Images.google),
        ),
        title: Text(
          'Sign In',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
