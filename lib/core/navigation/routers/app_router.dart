import 'package:fin_tamer/core/navigation/ui/main_wrapper.dart';
import 'package:fin_tamer/features/account/ui/account_page.dart';
import 'package:fin_tamer/features/category/ui/categories_page.dart';
import 'package:fin_tamer/features/settings/ui/settings_page.dart';
import 'package:fin_tamer/features/transaction/ui/income_details_page.dart';
import 'package:fin_tamer/features/transaction/ui/income_page.dart';
import 'package:fin_tamer/features/transaction/ui/outcome_details_page.dart';
import 'package:fin_tamer/features/transaction/ui/outcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static String initR = '/outcome';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorOutcomeKey = GlobalKey<NavigatorState>(debugLabel: 'outcome');
  static final _rootNavigatorIncomeKey = GlobalKey<NavigatorState>(debugLabel: 'income');
  static final _rootNavigatorAccountKey = GlobalKey<NavigatorState>(debugLabel: 'account');
  static final _rootNavigatorCategoriesKey = GlobalKey<NavigatorState>(debugLabel: 'categories');
  static final _rootNavigatorSettingsKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

  static final GoRouter router = GoRouter(
    initialLocation: initR,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainWrapper(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _rootNavigatorOutcomeKey,
            routes: [
              GoRoute(
                path: '/outcome',
                name: 'OUTCOME',
                builder: (context, state) => OutcomePage(
                  key: state.pageKey,
                ),
                routes: [
                  GoRoute(
                    path: 'details',
                    name: 'OUTCOME_DETAILS',
                    builder: (context, state) => OutcomeDetailsPage(
                      key: state.pageKey,
                    ),
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorIncomeKey,
            routes: [
              GoRoute(
                path: '/income',
                name: 'INCOME',
                builder: (context, state) => IncomePage(
                  key: state.pageKey,
                ),
                routes: [
                  GoRoute(
                    path: 'details',
                    name: 'INCOME_DETAILS',
                    builder: (context, state) => IncomeDetailsPage(
                      key: state.pageKey,
                    ),
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorAccountKey,
            routes: [
              GoRoute(
                path: '/account',
                name: 'Account',
                builder: (context, state) => AccountPage(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorCategoriesKey,
            routes: [
              GoRoute(
                path: '/categories',
                name: 'CATEGORIES',
                builder: (context, state) => CategoriesPage(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorSettingsKey,
            routes: [
              GoRoute(
                path: '/settings',
                name: 'SETTINGS',
                builder: (context, state) => SettingsPage(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
