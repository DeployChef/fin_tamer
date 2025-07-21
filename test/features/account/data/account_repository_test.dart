import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountRepository', () {
    test('returns local accounts with stats if local data is not empty', () {});

    test('fetches from remote and saves to local if local is empty', () {});

    test('getById returns account with stats if found locally', () {});

    test('getById fetches from remote if stats are missing locally', () {});

    test('getById returns null if not found anywhere', () {});

    test('create saves new account and returns it with stats', () {});

    test('update updates local entity, adds sync event, and returns updated account', () {});

    test('update throws if account not found locally', () {});

    test('getByApiId returns account with stats if found locally', () {});

    test('getByApiId fetches stats from remote if missing locally', () {});

    test('getByApiId returns null if not found', () {});

    test('updateLocalBalance updates balance and saves entity', () {});

    test('updateLocalBalance does nothing if account not found', () {});
  });
}
