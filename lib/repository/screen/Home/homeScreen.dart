import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/repository/screen/Home/cubit/homeCubit.dart';
import 'package:newsapp/repository/screen/Home/cubit/homeState.dart';
import 'package:newsapp/repository/widgets/uihelper.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 70.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20,
                ),
                UiHelper.CustomSearchTextField(
                    controller: searchController,
                    text: "Search News",
                    callback: () {}),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.notification_add_rounded),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                SizedBox(width: 20.w),
                UiHelper.CustomTExt(
                    text: "Latest News",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold)
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 180.h,
              child: BlocBuilder<HomeCubit, HomeStates>(
                  builder: (context, state) {
                    if (state is HomeLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is HomeLoadedState) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Stack(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 210.h,
                                      width: 310.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              7)),
                                      child: Image.network(
                                        state.homeModel.articles![index]
                                            .urlToImage
                                            .toString(),
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        UiHelper.CustomTExt(
                                            text:
                                            "By :${state.homeModel
                                                .articles![index].author
                                                .toString()}",
                                            color: Colors.white,
                                            fontSize: 10.sp),
                                        SizedBox(
                                          height: 10,
                                        ), Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            SizedBox(
                                              width: 200,
                                              child: UiHelper.CustomTExt(
                                                  text:
                                                  "${state.homeModel
                                                      .articles![index].title
                                                      .toString()}",
                                                  color: Colors.white,
                                                  fontSize: 10.sp),
                                            )
                                          ],
                                        )

                                      ],
                                    )
                                  ],
                                ));
                          },
                          itemCount: state.homeModel.articles!.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    } else if (state is HomeErrorState) {
                      return Center(
                        child: Text(state.error.toString()),
                      );
                    }
                    return Text("No Data Found");
                  }),
            ),
          ],
        ));
  }
}
