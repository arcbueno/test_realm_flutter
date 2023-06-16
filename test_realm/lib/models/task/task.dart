import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realm/realm.dart'; // import realm package
part 'task.g.dart'; // declare a part file.

@RealmModel()
class _Task {
  @PrimaryKey()
  late ObjectId localId;
  String? remoteId;
  late String title;
  late String? description;
  bool done = false;
}

extension TaskJ on Task {
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'done': done,
      };
}

Task taskJsonToRealmObject(DocumentSnapshot<Map<String, dynamic>> doc) {
  return Task(
    ObjectId(),
    doc.data()!["title"],
    description: doc.data()?["description"],
    done: doc.data()?["done"] ?? false,
    remoteId: doc.id,
  );
}
