import 'package:dependency_injection_get_it/locator.dart';
import 'package:dependency_injection_get_it/repository/meme_repo.dart';

class MemeDomainController {
  getNextMeme() async{
    // * call the repository and receive a meme
    // locator.get<MemeRepository>().fetchMeme();
  }
}