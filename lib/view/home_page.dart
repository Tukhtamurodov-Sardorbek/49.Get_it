import 'package:dependency_injection_get_it/domain/domain_controller.dart';
import 'package:dependency_injection_get_it/domain/models/meme.dart';
import 'package:dependency_injection_get_it/locator.dart';
import 'package:dependency_injection_get_it/repository/meme_repo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Meme? visibleMeme;

  @override
  void initState() {
    fetchMeme();
    super.initState();
  }

  Future<void> fetchMeme() async{
    Meme meme = await locator.get<MemeRepository>().fetchMeme();
    setState(() {
      visibleMeme = meme;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: visibleMeme == null
              ? const Text('No Meme loaded yet...')
              : Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Category: ${visibleMeme!.category}',
                        style: const TextStyle(fontSize: 26),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Image.network(visibleMeme!.image),
                      ),
                      const SizedBox(height: 8.0),
                      Text('Caption: ${visibleMeme!.caption}'),
                    ],
                  ),
                ),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_next),
        onPressed: () async{
          // * Locate the service with get_it and call fetchMeme
          Meme meme = await locator.get<MemeRepository>().fetchMeme();

          // * Use setState to update the visibleMeme
          setState(() {
            visibleMeme = meme;
          });
        },
      ),
    );
  }
}
