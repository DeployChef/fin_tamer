import 'package:fin_tamer/core/navigation/routers/app_routes.dart';
import 'package:fin_tamer/core/navigation/ui/main_wrapper.dart';
import 'package:fin_tamer/features/account/ui/account_page.dart';
import 'package:fin_tamer/features/category/ui/categories_page.dart';
import 'package:fin_tamer/features/settings/ui/settings_page.dart';
import 'package:fin_tamer/features/transaction/ui/income/income_analytics_page.dart';
import 'package:fin_tamer/features/transaction/ui/income/income_history_page.dart';
import 'package:fin_tamer/features/transaction/ui/income/income_page.dart';
import 'package:fin_tamer/features/transaction/ui/outcome/outcome_analytics_page.dart';
import 'package:fin_tamer/features/transaction/ui/outcome/outcome_page.dart';
import 'package:fin_tamer/features/transaction/ui/outcome/outcome_history_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static String initR = AppRoutes.outcome.path;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorOutcomeKey = GlobalKey<NavigatorState>(debugLabel: AppRoutes.outcome.name);
  static final _rootNavigatorIncomeKey = GlobalKey<NavigatorState>(debugLabel: AppRoutes.income.name);
  static final _rootNavigatorAccountKey = GlobalKey<NavigatorState>(debugLabel: AppRoutes.account.name);
  static final _rootNavigatorCategoriesKey = GlobalKey<NavigatorState>(debugLabel: AppRoutes.categories.name);
  static final _rootNavigatorSettingsKey = GlobalKey<NavigatorState>(debugLabel: AppRoutes.settings.name);

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
                path: AppRoutes.outcome.path,
                name: AppRoutes.outcome.name,
                builder: (context, state) => OutcomePage(
                  key: state.pageKey,
                ),
                routes: [
                  GoRoute(
                    path: AppRoutes.outcomeHistory.path,
                    name: AppRoutes.outcomeHistory.name,
                    builder: (context, state) => OutcomeHistoryPage(
                      key: state.pageKey,
                    ),
                    routes: [
                      GoRoute(
                        path: AppRoutes.outcomeAnalytics.path,
                        name: AppRoutes.outcomeAnalytics.name,
                        builder: (context, state) => OutcomeAnalyticsPage(
                          key: state.pageKey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorIncomeKey,
            routes: [
              GoRoute(
                path: AppRoutes.income.path,
                name: AppRoutes.income.name,
                builder: (context, state) => IncomePage(
                  key: state.pageKey,
                ),
                routes: [
                  GoRoute(
                    path: AppRoutes.incomeHistory.path,
                    name: AppRoutes.incomeHistory.name,
                    builder: (context, state) => IncomeHistoryPage(
                      key: state.pageKey,
                    ),
                    routes: [
                      GoRoute(
                        path: AppRoutes.incomeAnalytics.path,
                        name: AppRoutes.incomeAnalytics.name,
                        builder: (context, state) => IncomeAnalyticsPage(
                          key: state.pageKey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorAccountKey,
            routes: [
              GoRoute(
                path: AppRoutes.account.path,
                name: AppRoutes.account.name,
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
                path: AppRoutes.categories.path,
                name: AppRoutes.categories.name,
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
                path: AppRoutes.settings.path,
                name: AppRoutes.settings.name,
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
