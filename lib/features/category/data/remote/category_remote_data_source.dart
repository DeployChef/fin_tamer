import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/features/category/data/remote/dto/category_dto.dart';
import 'package:fin_tamer/features/category/data/remote/interfaces/i_category_remote_data_source.dart';

class CategoryRemoteDataSource implements ICategoryRemoteDataSource {
  final ApiService _apiService;

  CategoryRemoteDataSource(this._apiService);

  @override
  Future<List<CategoryDto>> getAll() async {
    final response = await _apiService.get('/categories');
    final List<dynamic> data = response.data;
    return data.map((json) => CategoryDto.fromJson(json)).toList();
  }

  @override
  Future<List<CategoryDto>> getByType(bool isIncome) async {
    final response = await _apiService.get('/categories', queryParameters: {
      'isIncome': isIncome.toString(),
    });
    final List<dynamic> data = response.data;
    return data.map((json) => CategoryDto.fromJson(json)).toList();
  }

  @override
  Future<CategoryDto?> getById(int id) async {
    try {
      final response = await _apiService.get('/categories/$id');
      return CategoryDto.fromJson(response.data);
    } catch (e) {
      // Если категория не найдена, возвращаем null
      return null;
    }
  }
}
