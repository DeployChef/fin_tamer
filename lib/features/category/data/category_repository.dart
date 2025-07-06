import 'package:fin_tamer/features/category/data/remote/dto/category_dto.dart';
import 'package:fin_tamer/features/category/domain/interfaces/i_category_repository.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:fin_tamer/features/category/data/remote/interfaces/i_category_remote_data_source.dart';
import 'package:fin_tamer/features/category/data/local/category_local_data_source.dart';
import 'package:fin_tamer/features/category/data/local/mappers/category_local_mapper.dart';

class CategoryRepository implements ICategoryRepository {
  final ICategoryRemoteDataSource remoteDataSource;
  final CategoryLocalDataSource localDataSource;

  CategoryRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Category>> getAll() async {
    final localEntities = await localDataSource.getAll();
    if (localEntities.isNotEmpty) {
      return localEntities.map((e) => e.toDomain()).toList();
    }
    final remoteDtos = await remoteDataSource.getAll();
    final entities = remoteDtos.map((e) => e.toEntity()).toList();
    await localDataSource.saveAll(entities);
    return entities.map((e) => e.toDomain()).toList();
  }

  @override
  Future<List<Category>> getByType(bool isIncome) async {
    final localEntities = await localDataSource.getByType(isIncome);
    if (localEntities.isNotEmpty) {
      return localEntities.map((e) => e.toDomain()).toList();
    }
    final remoteDtos = await remoteDataSource.getByType(isIncome);
    final entities = remoteDtos.map((e) => e.toEntity()).toList();
    await localDataSource.saveAll(entities);
    return entities.map((e) => e.toDomain()).toList();
  }

  @override
  Future<Category?> getById(int id) async {
    var localEntity = await localDataSource.getById(id);
    if (localEntity == null) {
      await getAll();
      localEntity = await localDataSource.getById(id);
    }

    return localEntity?.toDomain();
  }

  @override
  Future<Category?> getByApiId(int apiId) async {
    var localEntity = await localDataSource.getByApiId(apiId);
    if (localEntity == null) {
      await getAll();
      localEntity = await localDataSource.getByApiId(apiId);
    }

    if (localEntity != null) {
      return localEntity.toDomain();
    }

    final remoteDto = await remoteDataSource.getById(apiId);
    if (remoteDto != null) {
      final entity = remoteDto.toEntity();
      await localDataSource.save(entity);
      return entity.toDomain();
    }
    return null;
  }
}
