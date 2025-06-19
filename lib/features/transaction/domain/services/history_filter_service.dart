import 'package:fin_tamer/features/transaction/domain/models/sort_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_filter_service.g.dart';
part 'history_filter_service.freezed.dart';

@riverpod
class HistoryFilterService extends _$HistoryFilterService {
  @override
  HistoryFilterStateModel build() {
    final now = DateTime.now().toUtc();
    final today = DateTime(now.year, now.month, now.day);
    final startDate = today.add(const Duration(days: -30));
    final endDate = today.add(const Duration(days: 1)).add(const Duration(minutes: -1));

    return HistoryFilterStateModel(
      startDate: startDate,
      endDate: endDate,
      sortType: SortType.date,
    );
  }

  void setStart({required DateTime startDate}) {
    var newStartDate = DateTime(startDate.year, startDate.month, startDate.day);
    var newEndDate = state.endDate;

    if (newStartDate.isAfter(newEndDate)) {
      newEndDate = DateTime(newStartDate.year, newStartDate.month, newStartDate.day, 23, 59, 00);
    }

    state = HistoryFilterStateModel(startDate: newStartDate, endDate: newEndDate, sortType: state.sortType);
  }

  void setEnd({required DateTime endDate}) {
    var newStartDate = state.startDate;
    var newEndDate = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 00);

    if (newEndDate.isBefore(newStartDate)) {
      newStartDate = DateTime(newEndDate.year, newEndDate.month, newEndDate.day);
    }

    state = HistoryFilterStateModel(startDate: newStartDate, endDate: newEndDate, sortType: state.sortType);
  }

  void setSortType({required SortType sortType}) {
    state = HistoryFilterStateModel(startDate: state.startDate, endDate: state.endDate, sortType: sortType);
  }
}

@freezed
abstract class HistoryFilterStateModel with _$HistoryFilterStateModel {
  const factory HistoryFilterStateModel({
    required DateTime startDate,
    required DateTime endDate,
    required SortType sortType,
  }) = _HistoryFilterStateModel;
}
