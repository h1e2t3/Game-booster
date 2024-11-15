import 'package:get/get.dart';

class animatcontroller extends GetxController{

  RxBool animate=false.obs;
  RxDouble opacity = 0.0.obs;

  void startAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      animate.value = true;
      opacity.value = 1.0;

    });
  }

}