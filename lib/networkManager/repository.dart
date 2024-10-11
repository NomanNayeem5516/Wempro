import '../models/message.dart';
import '../models/responseMap.dart';
import '../models/response_list.dart';
import '../models/secandModel.dart';
import 'dio_helper.dart';

class Repository {
  static final DioHelper _dioHelper = DioHelper();

  Future<ResponseMap> responseInMap() async {
    Map<String, dynamic> response = await _dioHelper.get(
      url: 'https://reqres.in/api/users?page=2',
    );
    return ResponseMap.fromJson(response);
  }

  Future<List<ResponseList>> responseInList() async {
    List<dynamic> response = await _dioHelper.get(
      url: 'https://jsonplaceholder.typicode.com/posts',
    );
    return List<ResponseList>.from(
        response.map((e) => ResponseList.fromJson(e)));
  }

  Future<info> responseInfo() async {
    Map<String, dynamic> response = await _dioHelper.get(
      url:
          'http://team.dev.helpabode.com:54292/api/wempro/flutter-dev/coding-test-2024/',
    );
    return info.fromJson(response);
  }

  Future<secantModel> fetchSecand() async {
    Map<String, dynamic> response = await _dioHelper.get(
      url:
          'http://team.dev.helpabode.com:54292/api/wempro/flutter-dev/coding-test-2024/',
    );
    return secantModel.fromJson(response);
  }
}
