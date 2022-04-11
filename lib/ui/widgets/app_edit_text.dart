import 'package:flutter/material.dart';


class AppEditText extends StatelessWidget {
  final double radius;
  final Color backgroundcolor;
  final Color borderColor;
  final String headingText;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hint;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final bool isMultiLine;
  final String? Function(String?)? validator;
  final String? errorText;
  final dynamic suffixIcon;
  final dynamic prefixIcon;
  final bool? enabled;
  final bool? filled;
  final Color? headingTextColor;

  const AppEditText({
    Key? key,
    required this.headingText,
    required this.hint,
    this.borderColor = Colors.grey,
    this.radius = 4,
    this.backgroundcolor = Colors.grey,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.focusNode,
    this.textInputAction = TextInputAction.unspecified,
    this.textController,
    this.isMultiLine = false,
    this.validator,
    this.errorText,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.filled = true,
    this.headingTextColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [

                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    headingText,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: headingTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize:
                              Theme.of(context).textTheme.bodyText2?.fontSize,
                        ),
                  ),
                ),
              const SizedBox(height: 4),
              TextFormField(
                focusNode: focusNode,
                onTap: onTap,
                textInputAction: textInputAction,
                textCapitalization: textCapitalization,
                obscureText: obscureText,
                keyboardType: keyboardType,
                onChanged: onChanged,

                maxLines: isMultiLine ? 4 : 1,
                // inputFormatters: [
                //   keyboardType ==
                //           const TextInputType.numberWithOptions(
                //               signed: true, decimal: true)
                //       ? FilteringTextInputFormatter.digitsOnly
                //       : FilteringTextInputFormatter.singleLineFormatter,
                // ],
                controller: textController,
                validator: validator,
                enabled: enabled,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                    ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  filled: filled,
                  hintText: hint,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.grey,
                        fontSize:
                            Theme.of(context).textTheme.bodyText2?.fontSize,
                      ),
                  errorText: errorText,
                  border: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(color: borderColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
