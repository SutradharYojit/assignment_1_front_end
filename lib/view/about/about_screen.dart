import 'package:assignment_1/model/model.dart';
import 'package:assignment_1/view/about/about_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../resources/resources.dart';

class AboutScreen extends ConsumerStatefulWidget {
  const AboutScreen({super.key});

  @override
  ConsumerState<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends ConsumerState<AboutScreen> {
  Future<void> getData() async {
    await ref.read(about.notifier).getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final aboutData = ref.watch(about);
    final loading = ref.watch(about.notifier).loading;
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringManager.aboutTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: loading
              ? const Center(
                  child: SpinKitFoldingCube(
                    color: Colors.black,
                    size: 50.0,
                  ),
                )
              : Column(
                  children: [
                    ListTile(
                      title: const Text(
                        "App Description",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(aboutData.first.appDescription!),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: aboutData.first.routes!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              aboutData.first.routes![index].name!,
                              style: const TextStyle(fontSize: 22),
                            ),
                            subtitle: Text(aboutData.first.routes![index].description!),
                          );
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
