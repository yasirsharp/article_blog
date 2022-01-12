// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.blue;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: const MyHomePage(
        title: 'Article Blog',
        systemColor: primaryColor,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.systemColor})
      : super(key: key);

  final String title;
  final Color systemColor;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var defaultPadding = 25.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      drawer: buildMainDrawer(),
    );
  }

  var categoryList = <Widget>[
    SizedBox(width: 6),
    ElevatedButton(onPressed: () {}, child: const Text("deneme")),
    SizedBox(width: 6),
    ElevatedButton(onPressed: () {}, child: const Text("hjkl")),
    SizedBox(width: 6),
    ElevatedButton(onPressed: () {}, child: const Text("deneme")),
  ];
  Widget buildBody() {
    return Column(
      children: [
        bodyCategories(),
        Expanded(
          child: Center(child: Text("data")),
        ),
      ],
    );
  }

  Widget bodyCategories() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: defaultPadding / 2),
        height: 25,
        child: ListView.builder(
          itemBuilder: (c, i) => categoryList[i],
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
        ));
  }

  Drawer buildMainDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultPadding * 0.5),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.settings)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.light_mode)),
                ],
              ),
              Card(
                elevation: 0,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const ListTile(
                      isThreeLine: true,
                      leading: CircleAvatar(backgroundColor: Colors.red),
                      title: Text("Yazar Adı"),
                      subtitle: Text("yazar ile ilgili bilgiler"),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              drawerFooterInfo()
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerFooterInfo() {
    return Container(
      height: 100,
      alignment: Alignment.bottomCenter,
      child: const Card(
        elevation: 0,
        child: Text(
          "uygulama version bilgi",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: widget.systemColor),
      elevation: 0,
      centerTitle: true,
      title: Text(widget.title),
    );
  }
}
