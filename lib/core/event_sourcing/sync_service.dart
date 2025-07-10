import 'sync_event.dart';
import 'sync_event_data_source.dart';
import 'package:fin_tamer/core/event_sourcing/sync_account_handler.dart';
import 'package:fin_tamer/core/event_sourcing/sync_transaction_handler.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';

class SyncService {
  final SyncEventDataSource _eventDataSource;
  final SyncAccountHandler _accountHandler;
  final SyncTransactionHandler _transactionHandler;
  bool _isSyncing = false;

  SyncService(this._eventDataSource, this._accountHandler, this._transactionHandler);

  void addEvent(SyncEvent event) {
    _eventDataSource.addEvent(event);
    sync();
  }

  Future<void> sync() async {
    if (_isSyncing) return;
    _isSyncing = true;
    LoggerService.info('[SyncService] Start sync');
    try {
      while (true) {
        final events = _eventDataSource.getAllEvents();
        if (events.isEmpty) {
          LoggerService.info('[SyncService] No events to sync, exiting');
          break;
        }
        bool anySynced = false;
        for (final event in events) {
          LoggerService.debug('[SyncService] Handling event ${event.id} (${event.entityType}, ${event.eventType})');
          bool success = false;
          switch (event.entityType) {
            case EntityType.account:
              success = await _accountHandler.handle(event);
              break;
            case EntityType.transaction:
              success = await _transactionHandler.handle(event);
              break;
          }
          if (success) {
            LoggerService.info('[SyncService] Event ${event.id} synced and deleted');
            _eventDataSource.deleteEvent(event.id);
            anySynced = true;
          } else {
            LoggerService.warning('[SyncService] Event ${event.id} failed to sync, stopping');
            break;
          }
        }
        if (!anySynced) {
          LoggerService.info('[SyncService] No events were synced in this pass, exiting');
          break;
        }
      }
    } finally {
      _isSyncing = false;
      LoggerService.info('[SyncService] Sync finished');
    }
  }
}
