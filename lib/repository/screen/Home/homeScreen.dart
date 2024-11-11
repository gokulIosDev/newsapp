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
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Color(0XFF8adaf2),
          leading: Icon(Icons.face),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.directions_bike)),
            PopupMenuButton(itemBuilder: (BuildContext context){
          return [
            const PopupMenuItem(child: Text("1")),
            const PopupMenuItem(child: Text("2")),
            const PopupMenuItem(child: Text("3")),
          ]    ;
            }),
            const SizedBox(width: 10,)
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20,
                ),
                UiHelper.CustomSearchTextField(
                    controller: searchController,
                    text: "Search News",
                    callback: () {
                      BlocProvider.of<HomeCubit>(context)
                          .getData(query: searchController.text.toString());
                    }),
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
              height: 10.h,
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
              height: 250.h,
              child:
                  BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
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
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Image.network(
                                    state.homeModel.articles![index]
                                                .urlToImage ==
                                            null
                                        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCuBFa0RbPztjmTStKz1bMzzIU104tiKh_Sg&s"
                                        : state.homeModel.articles![index]
                                            .urlToImage
                                            .toString(),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    UiHelper.CustomTExt(
                                        text:
                                            "By :${state.homeModel.articles![index].author.toString()}",
                                        color: state.homeModel.articles![index]
                                                    .urlToImage ==
                                                null
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 10.sp),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: UiHelper.CustomTExt(
                                              text:
                                                  "${state.homeModel.articles![index].title.toString()}",
                                              color: state
                                                          .homeModel
                                                          .articles![index]
                                                          .urlToImage ==
                                                      null
                                                  ? Colors.black
                                                  : Colors.white,
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
            SizedBox(
              height: 10,
            ),
            Expanded(
              child:
                  BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
                if (state is HomeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeLoadedState) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 120.h,
                                width: 350.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Image.network(
                                  state.homeModel.articles![index].urlToImage ==
                                          null
                                      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCuBFa0RbPztjmTStKz1bMzzIU104tiKh_Sg&s"
                                      : state
                                          .homeModel.articles![index].urlToImage
                                          .toString(),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  UiHelper.CustomTExt(
                                      text:
                                          "By :${state.homeModel.articles![index].author.toString()}",
                                      color: state.homeModel.articles![index]
                                                  .urlToImage ==
                                              null
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 10.sp),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: UiHelper.CustomTExt(
                                            text:
                                                "${state.homeModel.articles![index].title.toString()}",
                                            color: state
                                                        .homeModel
                                                        .articles![index]
                                                        .urlToImage ==
                                                    null
                                                ? Colors.black
                                                : Colors.white,
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
                    scrollDirection: Axis.vertical,
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
