import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';

const _borderRadius = 10.0;

class RingoButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final double fontSize;
  final bool filled;
  final IconAlignment iconAlignment;
  final Widget? icon;
  final Widget child;
  final bool expand;
  const RingoButton(
      {super.key,
      required this.child,
      required this.padding,
      required this.fontSize,
      required this.filled,
      required this.iconAlignment,
      required this.icon,
      required this.onPressed, required this.expand});

  const RingoButton.medium(
      {super.key,
      required this.child,
      this.icon,
      this.iconAlignment = IconAlignment.start,
      required this.onPressed,
      this.filled = true, this.expand = false})
      : fontSize = 16,
        padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 32);

  const RingoButton.large(
      {super.key,
      required this.child,
      this.icon,
      this.iconAlignment = IconAlignment.start,
      required this.onPressed,
      this.filled = true, this.expand = false})
      : fontSize = 16,
        padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 40);

  const RingoButton.small(
      {super.key,
      required this.child,
      this.icon,
      this.iconAlignment = IconAlignment.start,
      required this.onPressed,
      this.filled = true, this.expand = false})
      : fontSize = 14,
        padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 28);

  ButtonStyle _getFilled(BuildContext context) {
    final theme = Theme.of(context);
    final disabledBk = theme.neutral[300];
    const disabledFk = Colors.white;
    return ElevatedButton.styleFrom(
      backgroundColor: theme.mainColor,
      disabledBackgroundColor: disabledBk,
      disabledForegroundColor: disabledFk,
      disabledIconColor: disabledFk,
      minimumSize: expand ? Size.fromHeight(0) : null,
      foregroundColor: Colors.white,
      textStyle: _textStyle,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius), // <-- Radius
      ),
    );
  }

  ButtonStyle _getPlain(BuildContext context) {
    final theme = Theme.of(context);
    final mainColor = theme.mainColor;
    final disabledBk = theme.neutral[300]!;
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      textStyle: _textStyle,
      foregroundColor: mainColor,
      elevation: 0,
      disabledForegroundColor: disabledBk,
      disabledIconColor: disabledBk,
      disabledBackgroundColor: Colors.white,
      minimumSize: expand ? Size.fromHeight(0) : null,
      padding: padding,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: onPressed == null ? disabledBk : mainColor, width: 2),
        borderRadius: BorderRadius.circular(
          _borderRadius,
        ), // <-- Radius
      ),
    );
  }

  TextStyle get _textStyle => TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {

    final buttonTheme = filled ? _getFilled(context) : _getPlain(context);

    return icon != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            label: child,
            iconAlignment: iconAlignment,
            style: buttonTheme,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: buttonTheme,
            child: child,
          );
  }
}
