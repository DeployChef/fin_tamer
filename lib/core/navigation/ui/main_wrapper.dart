import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/core/navigation/ui/navigation_svg_destination.dart';
import 'package:fin_tamer/styles/app_assets.dart';
import 'package:flutter/material.dart';
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

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationSvgDestination(
            label: loc.outcomes,
            svgPath: AppAssets.outcomeIcon,
          ),
          NavigationSvgDestination(
            label: loc.incomes,
            svgPath: AppAssets.incomeIcon,
          ),
          NavigationSvgDestination(
            label: loc.account,
            svgPath: AppAssets.accountIcon,
          ),
          NavigationSvgDestination(
            label: loc.categories,
            svgPath: AppAssets.categoriesIcon,
          ),
          NavigationSvgDestination(
            label: loc.settings,
            svgPath: AppAssets.settingsIcon,
          ),
        ],
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
