import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';

import 'dto/transaction_response_dto.dart';
import 'dto/transaction_request_dto.dart';
import 'dto/account_brief_dto.dart';
import 'package:fin_tamer/features/category/data/remote/dto/category_dto.dart';
import 'package:fin_tamer/features/category/data/remote/category_remote_data_source.dart';
import 'i_transaction_remote_data_source.dart';

class MockTransactionRemoteDataSource implements ITransactionRemoteDataSource {
  final IAccountRemoteDataSource accountRemoteDataSource;
  final CategoryRemoteDataSource categoryRemoteDataSource;

  MockTransactionRemoteDataSource(this.accountRemoteDataSource, this.categoryRemoteDataSource);

  final _db = <TransactionResponseDto>[
    TransactionResponseDto(
      id: 1,
      account: const AccountBriefDto(id: 1, name: 'Основной счёт', balance: '1000.00', currency: 'RUB'),
      category: const CategoryDto(id: 1, name: 'Зарплата', emoji: '💰', isIncome: true),
      amount: '500.00',
      transactionDate: DateTime.now(),
      comment: 'Зарплата за месяц',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TransactionResponseDto(
      id: 2,
      account: const AccountBriefDto(id: 1, name: 'Основной счёт', balance: '1000.00', currency: 'RUB'),
      category: const CategoryDto(id: 3, name: 'Одежда', emoji: '👗', isIncome: false),
      amount: '5000.00',
      transactionDate: DateTime.now(),
      comment: 'Куртка',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TransactionResponseDto(
      id: 3,
      account: const AccountBriefDto(id: 1, name: 'Основной счёт', balance: '1000.00', currency: 'RUB'),
      category: const CategoryDto(id: 3, name: 'Одежда', emoji: '👗', isIncome: false),
      amount: '5420.00',
      transactionDate: DateTime.now(),
      comment: 'Ребашка',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TransactionResponseDto(
      id: 4,
      account: const AccountBriefDto(id: 1, name: 'Основной счёт', balance: '1000.00', currency: 'RUB'),
      category: const CategoryDto(id: 3, name: 'Одежда', emoji: '👗', isIncome: false),
      amount: '40.00',
      transactionDate: DateTime.now(),
      comment: 'Штаны',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TransactionResponseDto(
      id: 5,
      account: const AccountBriefDto(id: 1, name: 'Основной счёт', balance: '1000.00', currency: 'RUB'),
      category: const CategoryDto(id: 4, name: 'На собачку', emoji: '🐶', isIncome: false),
      amount: '125000.00',
      transactionDate: DateTime.now(),
      comment: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TransactionResponseDto(
      id: 6,
      account: const AccountBriefDto(id: 1, name: 'Основной счёт', balance: '1000.00', currency: 'RUB'),
      category: const CategoryDto(id: 6, name: 'Продукты', emoji: '🎈', isIncome: false),
      amount: '12500.00',
      transactionDate: DateTime.now(),
      comment: "поел",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TransactionResponseDto(
      id: 7,
      account: const AccountBriefDto(id: 1, name: 'Основной счёт', balance: '1000.00', currency: 'RUB'),
      category: const CategoryDto(id: 3, name: 'Одежда', emoji: '👗', isIncome: false),
      amount: '33500.00',
      transactionDate: DateTime.now(),
      comment: "оделся",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TransactionResponseDto(
      id: 8,
      account: const AccountBriefDto(id: 1, name: 'Основной счёт', balance: '1000.00', currency: 'RUB'),
      category: const CategoryDto(id: 7, name: 'Спортзал', emoji: '🏋️‍♀️', isIncome: false),
      amount: '3500.00',
      transactionDate: DateTime.now(),
      comment: "подкачался",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Future<TransactionResponseDto> create(TransactionRequestDto request) async {
    final accountDto = await accountRemoteDataSource.getById(request.accountId);
    final account = AccountBriefDto(
      id: accountDto!.id,
      name: accountDto.name,
      balance: accountDto.balance,
      currency: accountDto.currency,
    );
    final category = await categoryRemoteDataSource.getById(request.categoryId);
    final newTransaction = TransactionResponseDto(
      id: _db.length + 1,
      account: account,
      category: category!,
      amount: request.amount,
      transactionDate: request.transactionDate,
      comment: request.comment,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );
    _db.add(newTransaction);
    return newTransaction;
  }

  @override
  Future<TransactionResponseDto?> update(int id, TransactionRequestDto request) async {
    final idx = _db.indexWhere((t) => t.id == id);
    if (idx == -1) return null;
    final accountDto = await accountRemoteDataSource.getById(request.accountId);
    final account = AccountBriefDto(
      id: accountDto!.id,
      name: accountDto.name,
      balance: accountDto.balance,
      currency: accountDto.currency,
    );
    final category = await categoryRemoteDataSource.getById(request.categoryId);
    final updated = _db[idx].copyWith(
      account: account,
      category: category!,
      amount: request.amount,
      transactionDate: request.transactionDate,
      comment: request.comment,
      updatedAt: DateTime.now().toUtc(),
    );
    _db[idx] = updated;
    return updated;
  }

  @override
  Future<void> delete(int id) async {
    _db.removeWhere((t) => t.id == id);
  }

  @override
  Future<TransactionResponseDto?> getById(int id) async {
    return _db.where((t) => t.id == id).firstOrNull;
  }

  @override
  Future<List<TransactionResponseDto>> getByPeriod(int accountId, DateTime startDate, DateTime endDate) async {
    return _db.where((t) => t.account.id == accountId && t.transactionDate.isAfter(startDate) && t.transactionDate.isBefore(endDate)).toList();
  }
}
