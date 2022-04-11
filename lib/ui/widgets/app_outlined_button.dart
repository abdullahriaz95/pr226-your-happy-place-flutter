import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final String title;
  final Function? onPressed;
  final bool disabled;
  final double verticalPadding;
  final double borderRadius;
  const AppOutlinedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.borderRadius = 24.0,
    this.verticalPadding = 0,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 3.0,
          color: Theme.of(context).primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      onPressed: disabled ? null : () => onPressed?.call(),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16.0, vertical: verticalPadding),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }
}
