import 'package:flutter/material.dart';

class CommonSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double width;
  final double height;
  final double padding;

  @override
  State<CommonSwitch> createState() => _CommonSwitchState();

  const CommonSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    required this.width,
    required this.height,
    required this.padding,
  }) : super(key: key);
}

class _CommonSwitchState extends State<CommonSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
