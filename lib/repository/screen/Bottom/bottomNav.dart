import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/repository/favourite/favouriteScreen.dart';
import 'package:newsapp/repository/screen/Home/homeScreen.dart';
import 'package:newsapp/repository/screen/profile/profileScreen.dart';
import 'package:newsapp/repository/widgets/uihelper.dart';

class BottomNAvigation extends StatefulWidget {
  const BottomNAvigation({super.key});

  @override
  State<BottomNAvigation> createState() => _BottomNAvigationState();
}

class _BottomNAvigationState extends State<BottomNAvigation> {
  int currentIndex = 0;
  
  List<Widget> pages = [HomeScreen(), FavouriteScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0XFF1F41BB),
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        selectedIconTheme:IconThemeData(color: Color(0XFF1F41BB)) ,
        onTap: (value){
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.smiley), label: "profile")
        ],
      ),
      body: IndexedStack(
        children: pages,
        index: currentIndex,
      ),
    );
  }
}
