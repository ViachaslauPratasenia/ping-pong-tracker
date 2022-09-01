import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  final Color containerColor;
  final Color? borderColor;

  final Color? containerSelectedColor;
  final Color? borderSelectedColor;

  final Color textColor;
  final double textSize;

  final MainAxisSize mainAxisSize;
  final double borderWidth;

  final ValueNotifier<bool> _highlightedNotifier = ValueNotifier<bool>(false);

  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.height = 50,
    this.borderColor,
    this.borderSelectedColor,
    this.containerColor = Colors.transparent,
    this.containerSelectedColor,
    this.textColor = Colors.black,
    this.textSize = 16,
    this.mainAxisSize = MainAxisSize.max,
    this.borderWidth = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ValueListenableBuilder(
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: RaisedButton(
              padding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  width: borderWidth,
                  color: !_highlightedNotifier.value
                      ? borderColor ?? Colors.transparent
                      : borderSelectedColor ?? Colors.transparent,
                ),
              ),
              color: Colors.transparent,
              animationDuration: const Duration(milliseconds: 600),
              highlightColor: containerSelectedColor,
              highlightElevation: 0,
              onPressed: onPressed,
              disabledColor: containerColor,
              disabledElevation: 0,
              onHighlightChanged: (isHighlighted) {
                _highlightedNotifier.value = isHighlighted;
              },
              elevation: 0,
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: mainAxisSize,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: textSize, color: textColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        valueListenable: _highlightedNotifier,
      ),
    );
  }
}
