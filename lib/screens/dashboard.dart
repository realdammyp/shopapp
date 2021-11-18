import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/dashboardController.dart';
import 'package:shopapp/screens/mainScreen/mainScreen.dart';
import 'package:shopapp/screens/orderScreen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
      builder: (dcontroller) {
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            currentIndex: dcontroller.index.value,
            onTap: dcontroller.changeTabIndex,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.sportscourt,
                label: 'Cart',
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(child: MainScreen());
                });
              case 1:
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(child: OrderScreen());
                });

                break;
              default:
                return const CupertinoTabView();
            }
          },
        );
        //ody: SafeArea(
        //     child: IndexedStack(
        //       index: dcontroller.index.value,
        //       children: [
        //         MainScreen(),
        //         OrderScreen(),

        //       ],
        //     ),
        //   ),
        //   bottomNavigationBar: BottomNavigationBar(
        //     unselectedItemColor: Colors.black,
        //     selectedItemColor: Colors.redAccent,
        //     onTap: dcontroller.changeTabIndex,
        //     currentIndex: dcontroller.index.value,
        //     showSelectedLabels: false,
        //     showUnselectedLabels: false,
        //     type: BottomNavigationBarType.fixed,
        //     backgroundColor: Colors.white,
        //     elevation: 0,
        //     items: [
        //       _bottomNavigationBarItem(
        //         icon: CupertinoIcons.home,
        //         label: 'Home',
        //       ),
        //       _bottomNavigationBarItem(
        //         icon: CupertinoIcons.sportscourt,
        //         label: 'News',
        //       ),
        //     ],
        //   ),
      },
    );
  }

  _bottomNavigationBarItem({IconData icon, String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
