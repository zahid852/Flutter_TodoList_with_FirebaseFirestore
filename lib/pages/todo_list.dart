import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class todoList extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  void _addTask() {
    FirebaseFirestore.instance
        .collection("todos")
        .add({"title": _textEditingController.text});
    _textEditingController.text = '';
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    hintText: "Enter task name",
                    hintStyle: TextStyle(fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 15)),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      _addTask();
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                    child: Text(
                      'Add Task',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('todos').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LinearProgressIndicator();
              }
              return Expanded(child: _buildList(snapshot.data!));
            })
      ],
    );
  }

  Widget _buildList(QuerySnapshot querySnapshot) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: querySnapshot.docs.length,
        itemBuilder: (context, index) {
          final doc = querySnapshot.docs[index];
          final task = Task.fromSnapshot(doc);
          return _buildListItem(task);
        });
  }

  Widget _buildListItem(Task task) {
    return Dismissible(
      key: Key(task.taskId),
      background: Container(
        color: Colors.red,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        _deleteItem(task);
      },
      child: ListTile(
        title: Text(task.title),
      ),
    );
  }

  void _deleteItem(Task task) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(task.taskId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              'Todo List',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          centerTitle: true,
        ),
        body: _buildBody(),
      ),
    );
  }
}
