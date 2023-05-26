import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/controller/controller/controller_home_avathar.dart';
import 'package:test_task/view/screens/screen_lorenprisom/screen_lorenprisom.dart';
import 'package:test_task/view/style/color.dart';
import 'package:test_task/view/style/fonts.dart';
import 'package:test_task/view/style/size.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CarouselController _controller = CarouselController();
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         
        },
      ),
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Royapuram",
                  style: headLine,
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 35.sp,
                )
              ],
            ),
            Text(
              "Thanmbu lane, Royapuram, chennai 13",
              style: subLine,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Stack(
              children: [
                CircleAvatar(
                  minRadius: 25.r,
                  backgroundImage: const AssetImage('assets/avt.jpg'),
                ),
                Positioned(
                    right: 3.w,
                    child: Icon(
                      Icons.brightness_1_rounded,
                      size: 15.sp,
                    ))
              ],
            ),
          )
        ],
      ),
      body: Obx(() {
        if (homeController.profileModel.photos == null|| homeController.profileModel.photos!.isEmpty) {
          const Center(
            child: Text("no data found"),
          );
        }
        if (homeController.loding.value) {
          const Center(
            child: CupertinoActivityIndicator(color: green),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              children: [
                h10,
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: grey,
                    ),
                    fillColor: lightGrey,
                    hintText: 'Search any products',
                    filled: true,
                    contentPadding: EdgeInsets.all(5.w),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0.r),
                    ),
                  ),
                ),
                h10,
                LimitedBox(
                  maxHeight: 110.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CircleAvatar(
                              maxRadius: 35.r,
                              backgroundImage: AssetImage(
                                  //    homeController.profileModel.photos![index].url!
                                  homeController.avatharDetails[index].image),
                            ),
                            Text(homeController.avatharDetails[index].title),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => w10,
                      itemCount: homeController.avatharDetails.length),
                ),
                // Obx(() {
                //   if (homeController.profileModel!.photos==null

                //   ) {
                //     Center(child: Text("no data found"),);
                //   }
                //   if (homeController.loding.value) {
                //     Center(
                //       child: CupertinoActivityIndicator(color: green),
                //     );
                //   }

                //  return
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                //   homeController.updateChanges(index);
                              },
                              autoPlay: true,
                              aspectRatio: 2.12,
                              enlargeCenterPage: true,
                              viewportFraction: 1),
                          items: homeController.profileModel.photos!
                              .map((item) => Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                          image: NetworkImage(item.url!),
                                          fit: BoxFit.cover,
                                        )),
                                    margin: EdgeInsets.all(5.0.w),
                                  ))
                              .toList()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: homeController.profileModel.photos!
                          .asMap()
                          .entries
                          .map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width:
                                homeController.profileModel.photos == entry.key
                                    ? 20.0.w
                                    : 6.w,
                            height: 6.0.w,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0.h, horizontal: 4.0.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : const Color.fromARGB(255, 59, 59, 59))
                                    .withOpacity(
                                        homeController.profileModel.photos ==
                                                entry.key
                                            ? 0.9
                                            : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                // }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lorem Ipsum",
                      style: midline,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(LorenIpsumDetails(),
                            transition: Transition.noTransition);
                      },
                      icon: const Icon(
                        CupertinoIcons.chevron_right_circle_fill,
                        color: grey,
                      ),
                    )
                  ],
                ),
                h10,
                SizedBox(
                  height: 270.h,
                  child: LimitedBox(
                    maxHeight: 270.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 270.h,
                            width: 200.w,
                            child: Column(
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 130,
                                          width: double.infinity,
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(homeController
                                                    .avatharDetails[index]
                                                    .image),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        h10,
                                        Text(
                                          "Lorem Ipsum has been the industry's standard dumm",
                                          style: commenText,
                                          maxLines: 2,
                                        ),
                                        h10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              homeController
                                                  .avatharDetails[index].price,
                                              style: priceText,
                                            ),
                                            const Icon(
                                              Icons.add,
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                        h10
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: homeController.avatharDetails.length),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
