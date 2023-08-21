import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/model.dart';
import '../../services/api_constants.dart';
import '../../services/api_services.dart';

final books = AutoDisposeStateNotifierProvider<BookDataList, List<BookData>>((ref) => BookDataList());

class BookDataList extends StateNotifier<List<BookData>> {
  BookDataList() : super([]);
  bool loading = true;

  Future<void> getData() async {

    state = await ApiServices().data(APIConstants.bookURL,ApiServices().apiScreen);
    state = [...state];
    loading = false;
  }
}
