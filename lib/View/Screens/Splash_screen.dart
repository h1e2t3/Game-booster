import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/animation_controller.dart';
import 'DashboardScreen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(animatcontroller());

  @override
  Widget build(BuildContext context) {
    controller.startAnimation();
      Future.delayed(Duration(seconds:4), () {
        Get.to(DashboardScreen());
      });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:Get.height/2.8,),
                Image(
                  image: AssetImage(
                    "image/assets/BoosterApp_Lgo.webp", // Adjust the path here
                  ),
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Gaming Tools \n Unlimited Booster",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Obx(()=>
                AnimatedPositioned(
                  duration: Duration(
                    seconds:2,
                  ),
                  curve: Curves.easeInOut,
                  right: controller.animate.value
                      ? MediaQuery.of(context).size.width /5 - 50
                      :-400,
                  bottom: 50,
                  child: AnimatedOpacity(
                    opacity: controller.opacity.value,
                    duration: Duration(seconds: 2),
                    child: Text(
                      "Game Booster",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ),
          ],
        )
      ),
    );
  }
}
