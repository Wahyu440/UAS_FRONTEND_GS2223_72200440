import 'package:flutter/material.dart';
import 'package:uas_frontend_gs2223_72200440/homeDrawer.dart';
import 'package:uas_frontend_gs2223_72200440/comment/comment_get.dart';
import 'package:uas_frontend_gs2223_72200440/photo/photo_get.dart';
import 'package:uas_frontend_gs2223_72200440/user/user_get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post_get extends StatefulWidget {
  const Post_get({Key? key}) : super(key: key);

  @override
  State<Post_get> createState() => _Post_getState();
}

class _Post_getState extends State<Post_get> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataPost();
  }

  Future _getDataPost() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get.clear();
          _get = data;
        });
      }
    } catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
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
        body: RefreshIndicator(
          onRefresh: _getDataPost,
          child: ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black45, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(_get[index]['title']),
                    subtitle: Text(_get[index]['body']),
                  ),
                );
              }),
        )
    );
  }
}
