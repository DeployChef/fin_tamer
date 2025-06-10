import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationSvgDestination extends StatelessWidget {
  const NavigationSvgDestination({
    super.key,
    required this.label,
    required this.svgPath,
  });

  final String label;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      label: label,
      icon: SvgPicture.asset(
        svgPath,
        colorFilter: const ColorFilter.mode(Color(0xff49454F), BlendMode.srcIn),
      ),
      selectedIcon: SvgPicture.asset(svgPath),
    );
  }
}
