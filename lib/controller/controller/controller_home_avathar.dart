import 'package:get/get.dart';
import 'package:test_task/model/model_home.dart';

import '../../model/mode_api.dart';
import '../service/service_carocel.dart';

class HomeController extends GetxController {
  RxBool loding = true.obs;
  ApiModel profileModel = ApiModel();

  Future<ApiModel?> getapiController() async {
    try {
      print("3333333");
      //  loding.value =true;
      var data = await ServiceCarocel.apiService();
      loding.value = false;
      print("4444444");
      print(data!.message);
      profileModel = data;
      update();
      return profileModel;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      print(e);
      print('catch bloc called');
      loding.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    print("66666666");
      print("7777");
      getapiController();
   update();
          print("88888");
    super.onInit();
         print("999999");
  
  }

  // updateChanges(int index) {
  //   profileModel!.photos![index].id= index;
  //   update();
  // }

  List<HomeAvatharModel> avatharDetails = [
    HomeAvatharModel(
        image: "assets/birth.jpg", title: "Birthday", price: "\$ 100"),
    HomeAvatharModel(
        image: "assets/any.jpg", title: "Anniversary", price: "\$ 200"),
    HomeAvatharModel(
        image: "assets/forher.jpg", title: "For her", price: "\$ 150"),
    HomeAvatharModel(
        image: "assets/forhim.jpg", title: "For him", price: "\$ 170"),
    HomeAvatharModel(
        image: "assets/best.jpg", title: "Best Wishes", price: "\$ 300"),
    HomeAvatharModel(
        image: "assets/teddy.jpg", title: "Teddys", price: "\$ 500.50"),
    HomeAvatharModel(
        image: "assets/any.jpg", title: "Anniversary", price: "\$ 800"),
    HomeAvatharModel(
        image: "assets/forher.jpg", title: "For her", price: "\$ 200"),
    HomeAvatharModel(
        image: "assets/forhim.jpg", title: "For him", price: "\$ 150"),
    HomeAvatharModel(
        image: "assets/best.jpg", title: "Best Wishes", price: "\$ 180"),
  ];
}
