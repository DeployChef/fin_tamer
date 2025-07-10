import 'dart:convert';
import 'package:fin_tamer/core/event_sourcing/sync_event.dart';
import 'package:fin_tamer/features/transaction/data/remote/i_transaction_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/data/remote/dto/transaction_request_dto.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';

class SyncTransactionHandler {
  final ITransactionRemoteDataSource remoteDataSource;

  SyncTransactionHandler(this.remoteDataSource);

  Future<bool> handle(SyncEvent event) async {
    try {
      switch (event.eventType) {
        case EventType.create:
          final dto = TransactionRequestDto.fromJson(jsonDecode(event.payloadJson));
          await remoteDataSource.create(dto);
          return true;
        case EventType.update:
          final dto = TransactionRequestDto.fromJson(jsonDecode(event.payloadJson));
          await remoteDataSource.update(int.parse(event.entityId), dto);
          return true;
        case EventType.delete:
          await remoteDataSource.delete(int.parse(event.entityId));
          return true;
      }
    } catch (e, stack) {
      LoggerService.error('[SyncTransactionHandler] Error handling event ${event.id}', e, stack);
      return false;
    }
  }
}
