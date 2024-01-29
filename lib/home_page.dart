import 'package:a/util/dialog_box.dart';
import 'package:a/util/todo_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller =TextEditingController();


  List ToDoList =[
    ["Make Tutorial", false],
    ["Do exercise", false],
  ];

  void checkBoxChanged(bool? value , int index){

    setState(() {
      ToDoList[index][1]=!ToDoList[index][1];
    });
}
  void saveNewTask(){
    setState(() {
      ToDoList.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
  }








//create new task
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: _controller ,
            onSave: saveNewTask ,
            onCancel: () => Navigator.of(context).pop(),
          );
      },
    );
  }
  void deleteTask(int index){
    setState(() {
      ToDoList.removeAt(index);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      appBar: AppBar(
        title: Text ("ToDo"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask ,
        child: Icon(Icons.add),
      ),


      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: ToDoList[index][0],
              taskCompleted: ToDoList[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
              deleteFunction:(context)=> deleteTask,
          );
        }

      ),
    );
  }
}
