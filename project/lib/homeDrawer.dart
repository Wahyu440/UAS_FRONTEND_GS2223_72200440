import 'dart:io';

import 'package:flutter/material.dart';
import 'post/post_get.dart';
import 'comment/comment_get.dart';
import 'photo/photo_get.dart';
import 'user/user_get.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeDrawer(),
  ));
}

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/logoipsum.png"),
                ),
                accountName: Text("Wahyu"),
                accountEmail: Text("wahyu.vivacious@si.ukdw.ac.id"),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeDrawer()));
                },
              ),
              ListTile(
                title: const Text('Posts'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Post_get()));
                },
              ),
              ListTile(
                title: const Text('Comments'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Comment_get()));
                },
              ),
              ListTile(
                title: const Text('Photos'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Photo_get()));
                },
              ),
              ListTile(
                title: const Text('Users'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => User_get()));
                },
              ),
            ],
          ),
        ),
        // body: ListView(
        //   children: [
        //     buildContainer(),
        //     buildContainer(),
        //     buildContainer(),
        //     buildCard()
        //   ],
        // ),
      );
  }
  // Card buildCard(){
  //   return Card(
  //     elevation: 8,
  //     child: Column(
  //       children: [
  //         ListTile(
  //             leading: Icon(Icons.add_to_photos_rounded),
  //             title: Text("Tiket To Mesir"),
  //             subtitle: Text("Just Need your Blood")
  //         ),
  //         Row(
  //           children: [
  //             TextButton(
  //                 onPressed: (){},
  //                 child: Text("Buy")),
  //             TextButton(
  //                 onPressed: (){},
  //                 child: Text("View")),
  //             TextButton(
  //                 onPressed: (){},
  //                 child: Text("Close"))
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
  // Container buildContainer() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       border: Border.all(width: 5
  //       ),
  //     ),
  //     child: Text("Mitologi Mesir adalah himpunan mitos-mitos dari Mesir kuno, yang melukiskan tindakan-tindakan para dewa Mesir sebagai sarana untuk memahami dunia. Keyakinan-keyakinan yang terkandung dalam mitos-mitos ini merupakan bagian penting dalam agama Mesir kuno. Mitos-mitos sering muncul dalam sastra dan Seni Mesir Kuno, terutama dalam cerita-cerita pendek dan materi keagamaan seperti nyanyian pujian, teks ritual, teks pemakaman, dan dekorasi kuil. Sumber-sumber ini jarang berisi versi lengkap sebuah mitos dan kebanyakan hanya mengandung bagian penggambaran singkatnya saja."),
  //     padding: EdgeInsets.all(10.0),
  //   );
  // }
}
