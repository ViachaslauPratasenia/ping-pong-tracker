import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class Tabs extends StatefulWidget {
  final int selectedIndex;
  final List<String> children;

  final void Function(int?)? onChanged;

  const Tabs({
    required this.selectedIndex,
    this.onChanged,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  void Function() _onTap(int index) => () {
        int? newSelectedIndex = index != _selectedIndex ? index : null;

        if (newSelectedIndex != null) {
          setState(() => _selectedIndex = newSelectedIndex);
        }

        if (widget.onChanged != null) {
          widget.onChanged!(newSelectedIndex);
        }
      };

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
      width: 70,
      height: 45,
      borderRadius: 15,
      selectedIndex: _selectedIndex,
      selectedTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      unSelectedTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labels: widget.children,
      selectedLabelIndex: (index) {
        _onTap(index).call();
      },
    );
  }
}
