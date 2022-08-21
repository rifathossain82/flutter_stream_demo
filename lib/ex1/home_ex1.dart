import 'package:flutter/material.dart';
import 'package:flutter_stream_demo/ex1/number_stream.dart';

class HomeEx1 extends StatefulWidget {
  const HomeEx1({Key? key}) : super(key: key);

  @override
  State<HomeEx1> createState() => _HomeEx1State();
}

class _HomeEx1State extends State<HomeEx1> {

  final myStream = NumberStream().stream;
  var subscription1;

  subscribe(){
    subscription1 = myStream.listen((event) => print("Data: $event"));
  }

  @override
  void initState() {
    //subscribe();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Ex1'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: StreamBuilder(
              stream: myStream,
              builder: (context, snapshot){
                print(snapshot);
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.connectionState == ConnectionState.done){
                  return Center(child:  Text('Done'),);
                }
                else if(snapshot.hasError){
                  return Center(child: Text('Error!'),);
                }
                else{
                  return snapshot.data.toString().isEmpty ? Center(child: Text('No Data'),) : Center(child: Text('${snapshot.data}'),);
                }
              },
            ),
          ),
          Container(
            height: 200,
            child: StreamBuilder(
              stream: myStream,
              builder: (context, snapshot){
                print(snapshot);
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.connectionState == ConnectionState.done){
                  return Center(child:  Text('Done'),);
                }
                else if(snapshot.hasError){
                  return Center(child: Text('Error!'),);
                }
                else{
                  return snapshot.data.toString().isEmpty ? Center(child: Text('No Data'),) : Center(child: Text('${snapshot.data}'),);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
