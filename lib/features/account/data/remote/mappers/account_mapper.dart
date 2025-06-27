import 'package:fin_tamer/features/account/domain/models/account_create_data.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_data.dart';
import 'package:fin_tamer/features/account/domain/models/stat_item.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_create_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_update_request_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/stat_item_dto.dart';

extension StatItemDtoMapper on StatItemDto {
  StatItem toDomain() => StatItem(
        id: id,
        name: name,
        value: value,
      );
}

extension AccountCreateDataMapper on AccountCreateData {
  AccountCreateRequestDto toDto() => AccountCreateRequestDto(
        name: name,
        balance: balance,
        currency: currency,
      );
}

extension AccountUpdateDataMapper on AccountUpdateData {
  AccountUpdateRequestDto toDto() => AccountUpdateRequestDto(
        name: name,
        balance: balance,
        currency: currency,
      );
}
