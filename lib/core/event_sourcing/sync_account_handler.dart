import 'dart:convert';
import 'package:fin_tamer/core/event_sourcing/sync_event.dart';
import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_update_request_dto.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';

class SyncAccountHandler {
  final IAccountRemoteDataSource remoteDataSource;

  SyncAccountHandler(this.remoteDataSource);

  Future<bool> handle(SyncEvent event) async {
    LoggerService.debug('Handling event', tag: 'SyncAccountHandler', data: {
      'eventId': event.id,
      'entityId': event.entityId,
      'eventType': event.eventType.toString(),
      'payload': event.payloadJson,
    });
    try {
      if (event.eventType == EventType.update) {
        final dto =
            AccountUpdateRequestDto.fromJson(jsonDecode(event.payloadJson));
        LoggerService.info('Updating account',
            tag: 'SyncAccountHandler',
            data: {
              'entityId': event.entityId,
              'dto': dto.toJson(),
            });
        await remoteDataSource.update(int.parse(event.entityId), dto);
        LoggerService.info('Account updated successfully',
            tag: 'SyncAccountHandler',
            data: {
              'entityId': event.entityId,
            });
        return true;
      }
      LoggerService.warning('Unknown eventType, skipping',
          tag: 'SyncAccountHandler',
          data: {
            'eventType': event.eventType.toString(),
          });
      return false;
    } catch (e, stack) {
      LoggerService.error(
          'Error handling event', e, stack, 'SyncAccountHandler', {
        'eventId': event.id,
        'entityId': event.entityId,
        'eventType': event.eventType.toString(),
      });
      return false;
    }
  }
}
