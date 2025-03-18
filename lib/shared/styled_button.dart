import 'package:flutter/material.dart';
import 'package:flutter_rpg/theme.dart';

class MyStyledButton extends StatelessWidget {
  const MyStyledButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        elevation: 9,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.primaryAccent,
      ),
      child: child,
    );
  }
}
