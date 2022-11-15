import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherTileWIdget extends StatelessWidget {
  final double width;
  final String label;
  final double labelSize;
  final Color color;
  final IconData icon;
  final double iconSize;
  final BorderRadius borderRadius;
  final Function() onTap;

  const LauncherTileWIdget({
    Key? key,
    this.width = 225,
    required this.label,
    this.labelSize = 30,
    required this.color,
    required this.icon,
    this.iconSize = 55,
    required this.borderRadius,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: color.withAlpha(150),
              borderRadius: borderRadius,
            ),
            width: width,
            child: Center(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      icon,
                      size: iconSize,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: labelSize,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
