import 'dart:convert';
import 'package:fin_tamer/core/event_sourcing/sync_event.dart';
import 'package:fin_tamer/features/transaction/data/remote/i_transaction_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_request_dto.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';
import 'package:fin_tamer/features/transaction/data/local/transaction_local_data_source.dart';

class SyncTransactionHandler {
  final ITransactionRemoteDataSource remoteDataSource;
  final TransactionLocalDataSource localDataSource;

  SyncTransactionHandler(this.remoteDataSource, this.localDataSource);

  Future<bool> handle(SyncEvent event) async {
    LoggerService.debug('Handling event', tag: 'SyncTransactionHandler', data: {
      'eventId': event.id,
      'entityId': event.entityId,
      'eventType': event.eventType.toString(),
      'payload': event.payloadJson,
    });
    try {
      switch (event.eventType) {
        case EventType.create:
          final dto =
              TransactionRequestDto.fromJson(jsonDecode(event.payloadJson));
          LoggerService.info('Creating transaction',
              tag: 'SyncTransactionHandler',
              data: {
                'entityId': event.entityId,
                'dto': dto.toJson(),
              });
          final created = await remoteDataSource.create(dto);
          final localId = int.parse(event.entityId);
          final localEntity = await localDataSource.getById(localId);
          if (localEntity != null) {
            localEntity.apiId = created.id;
            await localDataSource.save(localEntity);
            LoggerService.info('Local entity updated with apiId',
                tag: 'SyncTransactionHandler',
                data: {
                  'localId': localId,
                  'apiId': created.id,
                });
          }
          LoggerService.info('Transaction created successfully',
              tag: 'SyncTransactionHandler',
              data: {
                'entityId': event.entityId,
              });
          return true;
        case EventType.update:
          final dto =
              TransactionRequestDto.fromJson(jsonDecode(event.payloadJson));
          LoggerService.info('Updating transaction',
              tag: 'SyncTransactionHandler',
              data: {
                'entityId': event.entityId,
                'dto': dto.toJson(),
              });
          await remoteDataSource.update(int.parse(event.entityId), dto);
          LoggerService.info('Transaction updated successfully',
              tag: 'SyncTransactionHandler',
              data: {
                'entityId': event.entityId,
              });
          return true;
        case EventType.delete:
          LoggerService.info('Deleting transaction',
              tag: 'SyncTransactionHandler',
              data: {
                'entityId': event.entityId,
              });
          await remoteDataSource.delete(int.parse(event.entityId));
          // После успешного sync удаляем из локальной БД
          final localId = int.parse(event.entityId);
          final localEntity = await localDataSource.getById(localId);
          if (localEntity != null && localEntity.isDeleted) {
            await localDataSource.delete(localId);
            LoggerService.info('Transaction physically deleted from local DB',
                tag: 'SyncTransactionHandler',
                data: {
                  'entityId': event.entityId,
                });
          }
          LoggerService.info('Transaction deleted successfully',
              tag: 'SyncTransactionHandler',
              data: {
                'entityId': event.entityId,
              });
          return true;
      }
    } catch (e, stack) {
      LoggerService.error(
          'Error handling event', e, stack, 'SyncTransactionHandler', {
        'eventId': event.id,
        'entityId': event.entityId,
        'eventType': event.eventType.toString(),
      });
      return false;
    }
  }
}
