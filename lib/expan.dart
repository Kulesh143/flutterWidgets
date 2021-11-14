import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(
    home: new myApp(),
  ));
}
class MyItem{
  bool isExpanded;
  final String header;
  final Widget body;
  MyItem(this.isExpanded,this.header,this.body);
}
class myApp extends StatefulWidget{

  @override
  _State createState()=>new _State();
}
class _State extends State<myApp>{
  List<MyItem>items=new List<MyItem>();
  @override
  void initState(){
    for(int i=0;i<10;i++){
      items.add(new MyItem(false, 'Item ${i}', Container(
        padding: EdgeInsets.all(10.0),
        child: Text("Hello world"),
      )));
    }
  }
  ExpansionPanel createitem(MyItem item){
    return ExpansionPanel(headerBuilder: (BuildContext context,bool isExpanded){
      return Container(
        padding: EdgeInsets.all(5.0),
        child: Text('Header ${item.header}'),
      );
    }, body: item.body,isExpanded: item.isExpanded);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
       child: ListView(
         children: [
           ExpansionPanelList(
             expansionCallback: (int index, bool isExpanded){
               setState(() {
                 items[index].isExpanded=!items[index].isExpanded;
               });
             },children:
             items.map(createitem).toList(),


           )
         ],
       ),
      ),
    );
  }
}
