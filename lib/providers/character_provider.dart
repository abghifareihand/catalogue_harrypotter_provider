import 'package:flutter/material.dart';
import 'package:flutter_api_provider/models/character_model.dart';
import 'package:flutter_api_provider/services/api_service.dart';

class CharacterProvider extends ChangeNotifier {
  bool isLoading = false;
  List<CharacterModel> character = [];

  CharacterProvider() {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    isLoading = true;
    notifyListeners();

    character = await ApiService.fetchCharacter();
    isLoading = false;
    notifyListeners();

  }
}