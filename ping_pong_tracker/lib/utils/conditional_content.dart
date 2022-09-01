import 'package:flutter/material.dart';

class ConditionalContent extends StatelessWidget {
  final bool conditional;
  final Widget Function()? falsyBuilder;
  final Widget Function() truthyBuilder;

  const ConditionalContent({
    Key? key,
    required this.conditional,
    required this.truthyBuilder,
    this.falsyBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => conditional
      ? truthyBuilder()
      : falsyBuilder != null
          ? falsyBuilder!()
          : Container();
}
