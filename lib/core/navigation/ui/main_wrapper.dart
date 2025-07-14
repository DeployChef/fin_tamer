import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/core/navigation/ui/navigation_svg_destination.dart';
import 'package:fin_tamer/styles/app_assets.dart';
import 'package:fin_tamer/core/network/widgets/offline_banner.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_tamer/features/settings/domain/services/haptic_service.dart';

class MainWrapper extends ConsumerStatefulWidget {
  const MainWrapper({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends ConsumerState<MainWrapper> {
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
    final hapticsAsync = ref.watch(hapticServiceProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: widget.navigationShell,
          ),
          const OfflineBanner(),
        ],
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
        onDestinationSelected: (index) async {
          if (hapticsAsync is AsyncData && hapticsAsync.value == true) {
            HapticFeedback.selectionClick();
          }
          setState(() {
            selectedIndex = index;
          });
          _goToBranch(selectedIndex);
        },
      ),
    );
  }
}
