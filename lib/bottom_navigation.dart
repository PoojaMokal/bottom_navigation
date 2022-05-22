
import 'dart:convert';
import 'dart:ui';
import 'package:bottom_navigation/screens/first_screen.dart';
import 'package:bottom_navigation/screens/fourth_screen.dart';
import 'package:bottom_navigation/screens/second_screen.dart';
import 'package:bottom_navigation/screens/third_screen.dart';
import 'package:bottom_navigation/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// enum Availability { loading, available, unavailable }

// Availability _availability = Availability.loading;

class BottomNavigation extends StatefulWidget {
  final int selectedIndex;




  const BottomNavigation({
    Key?key,
    required this.selectedIndex,

  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex=0 ;
  List<Widget> screens = [];
  int NotificationCount= 0;
  // final InAppReview _inAppReview = InAppReview.instance;

  @override
  void initState() {
    super.initState();
    setState(() {
      print("Calling bottom navigation Bar");
    });
    index();
    screens = [
      const FirstScreen(),
      const SecondScreen(),
      const ThirdScreen(),
      const FourthScreen(),
    ];
  }

  index(){
    setState(() {
      _selectedIndex = widget.selectedIndex != null?widget.selectedIndex:0;
    });
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : const Color(0xFFF9F9F9),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if(_selectedIndex != 3)
            print("Bottom");
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: "",
              tooltip: "Home",
              icon: Image.asset(
                _selectedIndex == 0
                    ? 'assets/images/home-Filled.png'
                    : 'assets/images/home-Regular.png',
                height: _selectedIndex == 0 ? 2.8.h : 3.h,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              )),
          BottomNavigationBarItem(
            label: "",
            tooltip: "News",
            icon: Image.asset(
              _selectedIndex == 1
                  ? Theme.of(context).brightness == Brightness.dark
                      ? 'assets/icons/news.png'
                      : 'assets/images/noun_news_filled.png'
                  : 'assets/images/noun_news_regular.png',
              height: _selectedIndex == 1 ? 3.5.h : 3.h,
              fit: BoxFit.contain,
              color: Theme.of(context).brightness == Brightness.dark &&
                      _selectedIndex != 1
                  ? Colors.white
                  : null,
            ),
          ),
          BottomNavigationBarItem(
              label: "",
              tooltip: "Search",
              icon: Image.asset(
                _selectedIndex == 2
                    ? 'assets/images/search-Regular.png'
                    : 'assets/images/search-Regular1.png',
                height: _selectedIndex == 2 ? 2.9.h : 2.6.h,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              )),
          BottomNavigationBarItem(
              label: "",
              tooltip: "Notifications",
              icon: Stack(
                children: [
                  _selectedIndex == 3
                      ? Image.asset(
                          'assets/images/bell.png',
                          height: 2.9.h,
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        )
                      : Image.asset(
                            'assets/images/bell-Regular.png',
                            height: 3.h,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),

                  if (_selectedIndex != 3)
                    Positioned(
                        top: 0.0,
                        right: 3,
                        child: Container(
                          alignment: Alignment.center,
                          height: 1.h,
                          width: 1.h,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle),
                          // child: Text(
                          //   "12",
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //       color: Constants.whiteColor,
                          //       fontSize: 6,
                          //       fontWeight: FontWeight.w500),
                          // ),
                        ))
                ],
              )),
        ],
      ),
      body: InkWell(
         onTap: (){
           print("Bottom");
           setState(() {

           });
         },
          child: screens.elementAt(_selectedIndex)),
      backgroundColor: Colors.white,
    );
  }


}
