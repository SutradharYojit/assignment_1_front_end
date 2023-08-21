import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/model.dart';
import '../../services/api_constants.dart';
import '../../services/api_services.dart';

final about = AutoDisposeStateNotifierProvider<AboutData, List<AboutModel>>((ref) => AboutData());

class AboutData extends StateNotifier<List<AboutModel>> {
  AboutData() : super([]);
  bool loading = true;

  Future<void> getData() async {
    state = await ApiServices().data(APIConstants.aboutURL,ApiServices().aboutScreen);
    print(state[0].appDescription);
    state = [...state];
    loading = false;
  }
}
