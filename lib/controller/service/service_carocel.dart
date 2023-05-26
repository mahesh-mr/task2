import 'package:test_task/model/mode_api.dart';
import 'package:dio/dio.dart';

class ServiceCarocel {
  static Future<ApiModel?> apiService() async {
    try {
      print("11111111");
      var response = await Dio().get(
        "https://api.slingacademy.com/v1/sample-data/photos?offset=5&limit=20",
      );
      ApiModel model = ApiModel.fromJson(response.data);
   print("22222222");
      print(model.photos!.length);
      print(response);
      return model;
    } on DioError catch (e) {
      print("6656566565656556565  dist");
      print("${e.response!.data}===========");
      print("${e.message}=fdsfg=fd");
    } catch (e) {
      print("$e");
    }
    return null;
  }
}
