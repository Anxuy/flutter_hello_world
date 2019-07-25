
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// void main() => runApp(AppAdd2());

class AppAdd2 extends StatelessWidget{
  final appName = 'AppAdd2';
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home:new MyAddHomePage(title:appName),
    );
  }
}
class MyAddHomePage extends StatefulWidget{
  MyAddHomePage({Key key, this.title}):super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return new MyAddHomePageState();
  }
}

class MyAddHomePageState extends State<MyAddHomePage>{
  int _counter = 0;
  void _incrementCounter(){
    setState(() {
      print('counter : '+_counter.toString());
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You have pushed the add button'),
            new Text('$_counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      // bottomNavigationBar: new BottomNavigationBar(
      //   items:[
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       title: Text('Home')
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.child_friendly),
      //       title: Text('Friend')
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.message),title: Text('Message')),
      //     BottomNavigationBarItem(icon: Icon(Icons.notifications_active), title: Text('Active')),
      //     BottomNavigationBarItem(icon: Icon(Icons.sim_card),title: Text('Profile'))
      //   ],
      // ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }  
}