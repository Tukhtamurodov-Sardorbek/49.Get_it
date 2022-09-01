import 'dart:convert';
import 'package:dependency_injection_get_it/domain/models/meme.dart';
import 'package:http/http.dart';

class MemeRepository{
  Future<Meme> fetchMeme() async{
    final url = Uri.parse('https://some-random-api.ml/meme');
    Response response = await get(url);
    Map<String, dynamic> memeJson = jsonDecode(response.body);
    return Meme.fromJson(memeJson);
  }
}