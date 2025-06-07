import 'package:fin_tamer/core/navigation/models/main_navigation_bar_item_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  final List<NavigationDestination> _destinations = MainNavigationBarItemType.values
      .map((c) => NavigationDestination(
            label: c.label,
            icon: SvgPicture.asset(
              c.iconAssetPath,
              colorFilter: const ColorFilter.mode(Color(0xff49454F), BlendMode.srcIn),
            ),
            selectedIcon: SvgPicture.asset(c.iconAssetPath),
          ))
      .toList();

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: _destinations,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          _goToBranch(selectedIndex);
        },
      ),
    );
  }
}
