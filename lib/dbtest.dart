import 'package:flutter/material.dart';
import 'sqlite_db/databasehelper.dart';
class DBTest extends StatefulWidget {
  const DBTest({super.key});

  @override
  State<DBTest> createState() => _DBTestState();
}

class _DBTestState extends State<DBTest> {
  String title='';
  List<Map<String,dynamic>> items=[];
  bool loading=true;
  void getData()async{
    items=await DatabaseHelper.getItems();
    setState(() {
      loading=false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test DB'),),
      body: Center(
        child:loading?Center(child: CircularProgressIndicator()):ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
          return ListTile(
            title: Text(items[index]['title']!=null?items[index]['title']:'null'),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       showModalBottomSheet(context: context, builder: (context){
         return Column(children: [
           TextField(autofocus: true,
           onChanged: (value){
             title=value;
           },
           ),
           TextButton(onPressed: ()async{
             await DatabaseHelper.createItems(title);
             getData();
             Navigator.pop(context);
           }, child: Text('Add'), style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blueAccent)),)
         ],);
       });
      },child: Icon(Icons.add,color: Colors.white,), backgroundColor: Colors.blueAccent,),

    );
  }
}
