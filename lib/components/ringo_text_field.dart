import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class RingoTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final String? label;
  final TextInputType? keyboardType;
  final Widget? icon;
  const RingoTextField(
      {Key? key,
      this.contentPadding,
      this.hintText,
      this.obscureText = false,
      this.onFieldSubmitted,
      this.validator,
      this.controller,
      this.keyboardType, this.label, this.icon})
      : super(key: key);

  @override
  State<RingoTextField> createState() => _RingoTextFieldState();
}

class _RingoTextFieldState extends State<RingoTextField> {
  var showPassword = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.label != null)
          Text(widget.label!, style: theme.textTheme.titleMedium,),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.obscureText && !showPassword,
          keyboardType: widget.keyboardType,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            hintText: widget.hintText,
            filled: true,
            suffixIconConstraints: BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            contentPadding: EdgeInsets.zero,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: theme.neutral[300]!),
            ),

            suffixIcon: widget.obscureText
                ? InkWell(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    customBorder: const CircleBorder(),
                    child: Icon(
                        showPassword ? IconsaxPlusLinear.eye : IconsaxPlusLinear.eye_slash,
                        color: showPassword
                            ? theme.colorScheme.primary
                            : theme.neutral[500]!),
                  )
                : widget.icon,
          ),
        ),
      ],
    );
  }
}
