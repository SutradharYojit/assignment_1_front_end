import 'package:assignment_1/model/model.dart';
import 'package:assignment_1/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'api_screen_riverpod.dart';

class ApiScreen extends ConsumerStatefulWidget {
  const ApiScreen({super.key});

  @override
  ConsumerState<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends ConsumerState<ApiScreen> {

  Future<void> getData() async {
    await ref.read(books.notifier).getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final bookList = ref.watch(books);
    final loading = ref.watch(books.notifier).loading;
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringManager.apiTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loading
                  ? const Center(
                      child: SpinKitFoldingCube(
                        color: Colors.black,
                        size: 50.0,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: bookList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(children: []),
                                  Text("${StringManager.bookName} ${bookList[index].name}"),
                                  Text("${StringManager.bookPrice} ${bookList[index].price}"),
                                  Text("${StringManager.bookAuthor} ${bookList[index].author}"),
                                  Text("${StringManager.bookQuantity} ${bookList[index].stock}"),
                                  Text("${StringManager.bookDescription} ${bookList[index].description}"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
