import 'package:gdsc_flutter_camp_2023_app_tres/data/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MortyServices extends ChangeNotifier {
  List<Result> mortyResults = [];
  MortyServices() {
    getCharacters();
  }

  getCharacters() async {
    const url = "https://rickandmortyapi.com/api/character";
    //1. Paso
    //Obtener la respuesta de nuestra url
    final res = await http.get(Uri.parse(url));
    //2. Paso
    //Tenemos que mapear la respuesta obtenida
    if (res.statusCode == 200) {
      final resultResponse = characterModelFromJson(res.body);
      mortyResults.addAll(resultResponse.results);
    } else if (res.statusCode == 400) {
      print("object");
    }
    notifyListeners();
    // print(resultResponse.results[0]);
  }
}
