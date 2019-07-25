import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'dart:math' as math;

// void main() => runApp(MyApp());
// class Conf{
//   static var title = "StartUp Name Generator";
// }
final String appName = 'AppSaved';

class AppSaved extends StatelessWidget {
  // This widget is the root of your application.
  // static var ary = ["nihao", "asdf","asdfddd"];
  // static var rand = new math.Random();
  // var i = rand.nextInt(ary.length);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new RandWord(),
      // home: new Scaffold(
      //   appBar: new AppBar(
      //     title: new Text("TA"),
      //   ),
      //   body: new Center(
      //     child: new Text(ary[i] + " jj:" +i.toString()),
      //   ),
      // ),
    );
  }
}
class RandWord extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new RandWordState();
}
class WorldPair{
  String _word;
  int _idx;
  set word (String w) => _word = w;
  set idx (int i) => _idx = i;
  // int get idx => return _idx;
  String asText() =>  _idx.toString() + ":" + _word;
}
class RandWordState extends State<RandWord>{
  static var ary = ["nihao", "asdf","asdfddd","qwee","uus","oksii"];
  final _suggestions = <String>[];
  final _saved = new Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(appName),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(icon: new Icon(Icons.adjust), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //     BottomNavigationBarItem(icon: Icon(Icons.message),title: Text('Msg'))
      //   ],
      // ),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final tiles = _saved.map(
            (wp){
              return new ListTile(
                title:new Text(
                  wp,
                  style: _biggerFont,
                )
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Saved Suggestions"),
            ),
            body: new ListView(children: divided),
          );
        },
      )
    );
  }
  Widget _buildSuggestions(){
      return new ListView.builder(
        padding: const EdgeInsets.all(1.0),
        itemBuilder: (context, i){
          if(i.isOdd) return new Divider();
          final idx = i ~/2;
          if(idx >= _suggestions.length){
            _suggestions.addAll(ary);
          }
          final wp = new WorldPair();
          wp.word = _suggestions[idx];
          wp.idx = idx;
          print(wp.asText());
          return _buildRow(wp);
        },
      );
  }

  Widget _buildRow(WorldPair wp){
    var alredsave = _saved.contains(wp.asText());
    return new ListTile(
      title: new Text(
        wp.asText(),
        style:_biggerFont,
      ),
      trailing: new Icon(
        alredsave ? Icons.favorite : Icons.favorite_border,
        color: alredsave ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          print(wp.asText() +":"+ alredsave.toString()+":"+_suggestions.length.toString() +":"+_saved.length.toString());
          alredsave?_saved.remove(wp.asText()):_saved.add(wp.asText());
        });
      },
    );
  }
}