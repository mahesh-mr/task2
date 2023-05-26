import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/controller/controller/controller_home_avathar.dart';
import 'package:test_task/view/style/color.dart';
import 'package:test_task/view/style/fonts.dart';
import 'package:test_task/view/style/size.dart';

class LorenIpsumDetails extends StatelessWidget {
  LorenIpsumDetails({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: const Text("Lorem Ipsum "),
        leading: IconButton(
            onPressed: () {Get.back();},
            icon: const Icon(
              Icons.arrow_back,
              color: black,
            )),
      ),
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: GridView.builder(itemCount: homeController.avatharDetails.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 5,
                  mainAxisExtent: 280,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-14, 17),
                            spreadRadius: -15,
                            blurRadius: 13,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10.r),
                        color: white,
                      ),
                      height: 220.h,
                      width: 200.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              width: double.infinity,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(homeController
                                        .avatharDetails[index].image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            h10,
                            Text(
                              "Lorem Ipsum has been the industry's standard dumm",
                              style: commenText,
                              maxLines: 2,
                            ),
                            h10,
                            Text(
                              homeController.avatharDetails[index].price,
                              style: priceText,
                            ),
                            h10
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: white.withOpacity(.5),
                        child: const Icon(
                          Icons.favorite,
                          color: red,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(15.w),
                height: 50.h,
                width: double.infinity,
                color: white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ 500",
                      style: priceText,
                    ),
                    Container(
                      height: 30.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: black,
                      ),
                      child: Row(  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: white,
                          ),
                          Text("view cart",style: TextStyle(color: white,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
