import 'package:flutter/material.dart';

class NumericSpinWidget extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final Color color;

  final ValueChanged<int> onChanged;

  NumericSpinWidget({
    Key? key,
    required this.minValue,
    required this.maxValue,
    this.initialValue = 0,
    required this.onChanged,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.white,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  State<NumericSpinWidget> createState() {
    return _NumericSpinWidgetState();
  }
}

class _NumericSpinWidgetState extends State<NumericSpinWidget> {
  late int counter;

  @override
  void initState() {
    counter = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Material(
        color: widget.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.remove,
                  color: widget.color,
                ),
                iconSize: 20.0,
                onPressed: () {
                  setState(
                    () {
                      if (counter > widget.minValue) {
                        counter--;
                      }
                      widget.onChanged(counter);
                    },
                  );
                },
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(
                '$counter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.add,
                  color: widget.color,
                ),
                iconSize: 20.0,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(
                    () {
                      if (counter < widget.maxValue) {
                        counter++;
                      }
                      widget.onChanged(counter);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
