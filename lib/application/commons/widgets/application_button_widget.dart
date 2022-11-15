import 'package:flutter/material.dart';

class ApplicationButtonWidget extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final bool invertColor;
  final double? height;
  final Function()? onTap;

  const ApplicationButtonWidget({
    Key? key,
    this.child,
    this.color,
    this.invertColor = false,
    this.height = 45,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        color: (invertColor == true)
            ? Colors.transparent
            : onTap == null
                ? color!.withAlpha(240)
                : color ?? Theme.of(context).primaryColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              // color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: (invertColor == false)
                    ? Colors.transparent
                    : onTap == null
                        ? color!.withAlpha(240)
                        : color ?? Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
