// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, sized_box_for_whitespace, must_be_immutable, non_constant_identifier_names, avoid_print, unused_import, sort_child_properties_last
 
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/app_colors.dart';
import 'package:food_delivery_app/Screens/catigory_Screen.dart';
import 'package:food_delivery_app/Screens/chat_screen.dart';
import 'package:food_delivery_app/Screens/checkout_screen.dart';
import 'package:food_delivery_app/Screens/containt.dart';
import 'package:food_delivery_app/Screens/login_screen.dart';
import 'package:food_delivery_app/Screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static String id = "Home Screen"; 
  bool isSeeAll = true; 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController  = PageController(viewportFraction: 0.8);
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey(); 
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
       setState(() {
         print(_pageController.viewportFraction);
       });
    });
  }
  int selected_item = 0; 
  List<Widget> widgets = [
     ContaintsPage(),
     CatigoryScreen(),
     CheckOutScreen(),
     ChatWithUsScreen(),
    //  ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      key: scaffoldState,
      drawer: Drawer(  
         child: Column(
            children: [
                DrawerHeader(
                  child: Stack(
                    children: [
                      
                      Positioned( 
                        bottom: 5.0, 
                        left: 0.0, 
                        right: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, bottom: 5.0),
                              child: CircleAvatar(
                                radius: 37, 
                                backgroundColor: Colors.grey,
                                child: CircleAvatar(
                                  radius: 35, 
                                  backgroundImage: NetworkImage("https://londonimageinstitute.com/wp-content/uploads/2020/08/What-is-Personal-Image-Consulting.jpg"),
                                ),
                              ),
                            ), 
                            Text('${user!.displayName}', style: TextStyle(fontSize: 18, color: Colors.white),),
                            SizedBox(height: 5.0,), 
                            Text("${user.email}", style: TextStyle(fontSize: 18, color: Colors.white),)
                          ],
                        ),
                      )
                    ],
                  ), 
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.4,
                      fit: BoxFit.fill,
                      image: NetworkImage("https://images.pexels.com/photos/1640774/pexels-photo-1640774.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
                    ),
                    color: Colors.black
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home", style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.4)),),
                  onTap: () {
                    Navigator.pushNamed(context, ContaintsPage.id);
                  },
                  ),
                ListTile(
                  leading: Icon(Icons.grid_3x3_outlined),
                  title: Text("Catigory", style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.4))),
                  onTap: () {
                    Navigator.pushNamed(context, CatigoryScreen.id);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text("Contact", style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.4))),
                  onTap: () {
                    Navigator.pushNamed(context, ChatWithUsScreen.id);
                  },
                ), 
                ListTile(
                  leading: Icon(Icons.shopping_cart_checkout),
                  title: Text("Cart", style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.4))),
                  onTap: () {
                    Navigator.pushNamed(context, CheckOutScreen.id);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.place),
                  title: Text("Location", style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.4))),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text("About", style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.4))),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout", style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.4))),
                  onTap: () async{
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
            ],
         ),
       ),
      backgroundColor: const Color(0xFFEBEAEF),
       body: selected_item < 4 ? widgets.elementAt(selected_item) : null,
       bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,  
        currentIndex: selected_item ,
        showUnselectedLabels: true, 
        showSelectedLabels: true, 
        selectedItemColor: KPrimaryColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 16,
        selectedLabelStyle: TextStyle(
          fontSize: 15,
          letterSpacing: 1.0 
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 15, 
          letterSpacing: 1.0,
        ),
        onTap: (index) {
          setState(() { 
              selected_item = index;
          });
        },
         items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28,), label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: 28,), label: "Catigory"
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 28,), label: "Cart"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call, size: 28,), label: "Call"
          ), 
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: (){
                scaffoldState.currentState!.openDrawer();
              }, 
              icon: Icon(Icons.person)
            ), label: "Search"
          ), 
         ],
       ),
    );
  }
}

