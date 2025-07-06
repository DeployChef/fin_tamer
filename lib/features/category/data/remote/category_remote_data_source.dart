import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/features/category/data/remote/dto/category_dto.dart';
import 'package:fin_tamer/features/category/data/remote/interfaces/i_category_remote_data_source.dart';

class CategoryRemoteDataSource implements ICategoryRemoteDataSource {
  final ApiService _apiService;

  CategoryRemoteDataSource(this._apiService);

  @override
  Future<List<CategoryDto>> getAll() async {
    final List<dynamic> data = await _apiService.get<List<dynamic>>('/categories');
    return data.map((json) => CategoryDto.fromJson(json)).toList();
  }

  @override
  Future<List<CategoryDto>> getByType(bool isIncome) async {
    try {
      final List<dynamic> data = await _apiService.get<List<dynamic>>('/categories', queryParameters: {
        'isIncome': isIncome.toString(),
      });
      return data.map((json) => CategoryDto.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<CategoryDto?> getById(int id) async {
    try {
      final Map<String, dynamic> data = await _apiService.get<Map<String, dynamic>>('/categories/$id');
      return CategoryDto.fromJson(data);
    } catch (e) {
      // Если категория не найдена, возвращаем null
      return null;
    }
  }
}
