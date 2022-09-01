import 'package:dependency_injection_get_it/domain/domain_controller.dart';
import 'package:dependency_injection_get_it/domain/models/meme.dart';
import 'package:dependency_injection_get_it/locator.dart';
import 'package:dependency_injection_get_it/repository/meme_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Meme? visibleMeme;
  bool isPressed = false;

  @override
  void initState() {
    fetchMeme();
    super.initState();
  }

  Future<void> fetchMeme() async {
    // * Locate the service with get_it and call fetchMeme
    Meme meme = await locator.get<MemeRepository>().fetchMeme();

    // * Use setState to update the visibleMeme
    setState(() {
      visibleMeme = meme;
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: visibleMeme == null
              ? const Text('No Meme loaded yet...')
              : Card(
                  elevation: 10.0,
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
                          child: Image.network(
                            visibleMeme!.image,
                            frameBuilder: (BuildContext context, Widget child,
                                int? frame, bool wasSynchronouslyLoaded) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: child,
                              );
                            },
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: child),
                              );
                            },
                          ),
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
        child: isPressed
            ? const CupertinoActivityIndicator()
            : const Icon(Icons.skip_next),
        onPressed: () {
          if (!isPressed) {
            setState(() {
              isPressed = true;
            });
            fetchMeme();
          }
        },
      ),
    );
  }
}
