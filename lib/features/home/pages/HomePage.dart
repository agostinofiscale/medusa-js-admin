import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_js_admin/routes/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ProductsRoute(),
        ResourcesRoute(),
        NotificationsRoute(),
        SettingsRoute()
      ],
      transitionBuilder: (context,child,animation)=> FadeTransition(                
              opacity: animation,                
              // the passed child is technically our animated selected-tab page                
              child: child,                
            ),       
      builder: (context, child) {                
        // obtain the scoped TabsRouter controller using context                
        final tabsRouter = AutoTabsRouter.of(context);                
        // Here we're building our Scaffold inside of AutoTabsRouter                
        // to access the tabsRouter controller provided in this context                
        //                 
        //alterntivly you could use a global key                
        return Scaffold(                
            body: child,               
            bottomNavigationBar: BottomNavigationBar(  
              type: BottomNavigationBarType.fixed,              
              currentIndex: tabsRouter.activeIndex,                
              onTap: (index) {                
                // here we switch between tabs                
                tabsRouter.setActiveIndex(index);                
              },                
              items: const [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.people)),                
                BottomNavigationBarItem(label: 'Resources', icon: Icon(Icons.stacked_bar_chart)),   
                BottomNavigationBarItem(label: 'Notifications', icon: Icon(Icons.notifications)),             
                BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),                
              ],                
            ));                
      },       
    );
  }
}
