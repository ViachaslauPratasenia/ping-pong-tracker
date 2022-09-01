import 'package:flutter/material.dart';

class ListBottomSheet extends StatelessWidget {
  final List<String> children;

  const ListBottomSheet({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: children.length,
          itemBuilder: (_, index) {
            return Text(children[index]);
          },
        ),
      ),
    );
  }
}
