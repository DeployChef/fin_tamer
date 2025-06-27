import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_filter_service.g.dart';
part 'analytics_filter_service.freezed.dart';

@riverpod
class AnalyticsFilterService extends _$AnalyticsFilterService {
  @override
  AnalyticsFilterStateModel build({required bool isIncome}) {
    final now = DateTime.now().toUtc();
    final today = DateTime(now.year, now.month, now.day);
    final startDate = today.add(const Duration(days: -30));
    final endDate = today.add(const Duration(days: 1)).add(const Duration(minutes: -1));

    return AnalyticsFilterStateModel(
      startDate: startDate,
      endDate: endDate,
    );
  }

  void setStart({required DateTime startDate}) {
    var newStartDate = DateTime(startDate.year, startDate.month, startDate.day);
    var newEndDate = state.endDate;

    if (newStartDate.isAfter(newEndDate)) {
      newEndDate = DateTime(newStartDate.year, newStartDate.month, newStartDate.day, 23, 59, 00);
    }

    state = AnalyticsFilterStateModel(startDate: newStartDate, endDate: newEndDate);
  }

  void setEnd({required DateTime endDate}) {
    var newStartDate = state.startDate;
    var newEndDate = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 00);

    if (newEndDate.isBefore(newStartDate)) {
      newStartDate = DateTime(newEndDate.year, newEndDate.month, newEndDate.day);
    }

    state = AnalyticsFilterStateModel(startDate: newStartDate, endDate: newEndDate);
  }
}

@freezed
abstract class AnalyticsFilterStateModel with _$AnalyticsFilterStateModel {
  const factory AnalyticsFilterStateModel({
    required DateTime startDate,
    required DateTime endDate,
  }) = _AnalyticsFilterStateModel;
}
