import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String content;
  String todoId;
  Timestamp dateCreated;
  bool done;

  TodoModel(
    this.content,
    this.todoId,
    this.dateCreated,
    this.done,
  );

  TodoModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
    Map<String, dynamic> prod,
  ) {
    todoId = documentSnapshot.id;
    content = prod['content'];
    dateCreated = prod['dateCreated'];
    done = prod["done"];
  }
}
