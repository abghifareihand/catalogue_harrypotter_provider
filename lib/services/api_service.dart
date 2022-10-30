import 'package:dio/dio.dart';
import 'package:flutter_api_provider/constants.dart';
import 'package:flutter_api_provider/models/character_model.dart';

class ApiService {
  static var dio = Dio();

  static Future<List<CharacterModel>> fetchCharacter() async {
    var response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => CharacterModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load character');
    }

  }
}