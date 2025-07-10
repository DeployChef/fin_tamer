import 'dart:convert';
import 'package:fin_tamer/core/event_sourcing/sync_event.dart';
import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_update_request_dto.dart';
import 'package:fin_tamer/core/utils/logger_service.dart';

class SyncAccountHandler {
  final IAccountRemoteDataSource remoteDataSource;

  SyncAccountHandler(this.remoteDataSource);

  Future<bool> handle(SyncEvent event) async {
    try {
      if (event.eventType == EventType.update) {
        final dto = AccountUpdateRequestDto.fromJson(jsonDecode(event.payloadJson));
        await remoteDataSource.update(int.parse(event.entityId), dto);
        return true;
      }
      return false;
    } catch (e, stack) {
      LoggerService.error('[SyncAccountHandler] Error handling event ${event.id}', e, stack);
      return false;
    }
  }
}
