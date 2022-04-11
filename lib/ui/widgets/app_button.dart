import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function? onPressed;
  final Function? disabledOnPressed;
  final bool disabled;
  final double verticalPadding;
  final double borderRadius;
  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.borderRadius = 24.0,
    this.verticalPadding = 0,
    this.disabled = false,
    this.disabledOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            disabled ? Colors.grey : Theme.of(context).primaryColor,
          ),
          backgroundColor: MaterialStateProperty.all(
            disabled ? Colors.grey : Theme.of(context).primaryColor,
          )
          // backgroundColor: MaterialStateProperty.resolveWith((states) {
          //   disabled ? Colors.grey : Theme.of(context).primaryColor;
          // }),
          ),
      onPressed:
          disabled ? () => disabledOnPressed?.call() : () => onPressed?.call(),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16.0, vertical: verticalPadding),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
