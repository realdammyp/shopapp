import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shopapp/controllers/dashboardController.dart';
import 'package:shopapp/screens/mainScreen.dart';
import 'package:shopapp/screens/orderScreen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   DashboardController dcontroller = Get.put(DashboardController());

    return GetBuilder<DashboardController>(
      builder: (dcontroller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: dcontroller.index,
              children: [
                MainScreen(),
                OrderScreen(),
                
                
                
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            onTap: dcontroller.changeTabIndex,
            currentIndex: dcontroller.index,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.sportscourt,
                label: 'News',
              ),
              
              
            ],
          ),
        );
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
