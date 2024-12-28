import 'package:flutter/material.dart';
import 'package:next_step/Const/const_Var.dart';
import 'package:next_step/Const/const_colo.dart';
import 'package:next_step/Const/const_fonts.dart';
import 'package:next_step/Widgets/Home_PageWidget/Best_Stories.dart';
import 'package:next_step/Widgets/Home_PageWidget/Home_PageWidget.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              appname,
              style: TextStyle(
                fontSize: 14,
                fontFamily: regularfont,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color(0xFF4B5945),
            expandedHeight: 190.0,
            floating: false,
            pinned: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                );
              },
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                margin: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {
                    // Handle notification action
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 64.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(height: 60),
                    Text(
                      "SAGAR Teotia",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "SAGAR TOETIA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: homeBg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   // Spacing after SliverAppBar
                  MainSectionWidget(),
                  const SizedBox(height: 20,),
                  BestStoreiesWidget(),
                  const SizedBox(height: 20,),
                  BestStoreiesWidget(),
                   // Your custom widget that is shown after header
                  // Additional widgets go here (if needed)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
