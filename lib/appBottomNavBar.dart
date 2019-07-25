import 'package:flutter/material.dart';

// void main(List<String> args) =>runApp(MyBottomNavSLW());

class AppBottomNav extends StatelessWidget{
  final String appName = 'AppBottomNav';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: MyBottomNavSFW(title:appName),
    );
  }
}

class MyBottomNavSFW extends StatefulWidget{
  MyBottomNavSFW({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyBottomNavST createState() => MyBottomNavST();
}

class MyBottomNavST extends State<StatefulWidget>{
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('BottomNavBar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          myBottomNavigationBarItem('首页', Icons.home),
          myBottomNavigationBarItem('交友', Icons.mail),
          myBottomNavigationBarItem('信息', Icons.message),
          myBottomNavigationBarItem('活动', Icons.local_activity),
          myBottomNavigationBarItem('我的', Icons.power)
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
            print("index:" +index.toString());
          });
        },
      ),
    );
  }
}

BottomNavigationBarItem myBottomNavigationBarItem (String name, IconData icon) {
  return BottomNavigationBarItem(
          icon: Icon(icon,
          // color: Colors.blue
          ),
          title: Text(name, 
            // style: TextStyle(color: Colors.blue
            )
          );
}