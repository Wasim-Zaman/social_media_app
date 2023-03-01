import 'package:flutter/material.dart';
import 'package:social_media/res/images.dart';

class GoogleSigninButton extends StatelessWidget {
  const GoogleSigninButton({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * 0.5,
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            child: Image.asset(Images.google),
          ),
          title: Text(
            'Sign In',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
