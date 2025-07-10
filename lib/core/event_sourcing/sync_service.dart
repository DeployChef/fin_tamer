import 'sync_event.dart';
import 'sync_event_data_source.dart';
import 'package:fin_tamer/core/event_sourcing/sync_account_handler.dart';
import 'package:fin_tamer/core/event_sourcing/sync_transaction_handler.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SyncService {
  final SyncEventDataSource _eventDataSource;
  final SyncAccountHandler _accountHandler;
  final SyncTransactionHandler _transactionHandler;
  bool _isSyncing = false;

  SyncService(
      this._eventDataSource, this._accountHandler, this._transactionHandler);

  void addEvent(SyncEvent event) {
    _eventDataSource.addEvent(event);
    sync();
  }

  Future<void> sync() async {
    final checker = InternetConnectionChecker.createInstance();
    final hasInternet = await checker.hasConnection;
    if (!hasInternet) {
      LoggerService.info('No internet, skip sync', tag: 'SyncService');
      return;
    }
    if (_isSyncing) return;
    _isSyncing = true;
    LoggerService.info('Start sync', tag: 'SyncService');
    try {
      while (true) {
        final events = _eventDataSource.getAllEvents();
        if (events.isEmpty) {
          LoggerService.info('No events to sync, exiting', tag: 'SyncService');
          break;
        }
        bool anySynced = false;
        for (final event in events) {
          LoggerService.debug('Handling event', tag: 'SyncService', data: {
            'eventId': event.id,
            'entityType': event.entityType.toString(),
            'eventType': event.eventType.toString(),
          });
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
            LoggerService.info('Event synced and deleted',
                tag: 'SyncService',
                data: {
                  'eventId': event.id,
                  'entityType': event.entityType.toString(),
                  'eventType': event.eventType.toString(),
                });
            _eventDataSource.deleteEvent(event.id);
            anySynced = true;
          } else {
            LoggerService.warning('Event failed to sync, stopping',
                tag: 'SyncService',
                data: {
                  'eventId': event.id,
                  'entityType': event.entityType.toString(),
                  'eventType': event.eventType.toString(),
                });
            break;
          }
        }
        if (!anySynced) {
          LoggerService.info('No events were synced in this pass, exiting',
              tag: 'SyncService');
          break;
        }
      }
    } finally {
      _isSyncing = false;
      LoggerService.info('Sync finished', tag: 'SyncService');
    }
  }
}
