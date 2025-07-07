import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/features/category/data/remote/dto/category_dto.dart';
import 'package:fin_tamer/features/category/data/remote/interfaces/i_category_remote_data_source.dart';
import 'package:fin_tamer/core/utils/isolate_deserializer.dart';

class CategoryRemoteDataSource implements ICategoryRemoteDataSource {
  final ApiService _apiService;

  CategoryRemoteDataSource(this._apiService);

  @override
  Future<List<CategoryDto>> getAll() async {
    final response = await _apiService.get<String>('/categories');
    return await IsolateDeserializer.deserializeList<CategoryDto>(
      response,
      CategoryDto.fromJson,
    );
  }

  @override
  Future<List<CategoryDto>> getByType(bool isIncome) async {
    try {
      final response = await _apiService.get<String>(
        '/categories',
        queryParameters: {
          'isIncome': isIncome.toString(),
        },
      );
      return await IsolateDeserializer.deserializeList<CategoryDto>(
        response,
        CategoryDto.fromJson,
      );
    } catch (e) {
      return [];
    }
  }

  @override
  Future<CategoryDto?> getById(int id) async {
    try {
      final response = await _apiService.get<String>('/categories/$id');
      return await IsolateDeserializer.deserialize<CategoryDto>(
        response,
        CategoryDto.fromJson,
      );
    } catch (e) {
      // Если категория не найдена, возвращаем null
      return null;
    }
  }
}
