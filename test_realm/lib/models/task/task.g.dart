// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Task extends _Task with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Task(
    ObjectId localId,
    String title, {
    String? remoteId,
    String? description,
    bool done = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Task>({
        'done': false,
      });
    }
    RealmObjectBase.set(this, 'localId', localId);
    RealmObjectBase.set(this, 'remoteId', remoteId);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'done', done);
  }

  Task._();

  @override
  ObjectId get localId =>
      RealmObjectBase.get<ObjectId>(this, 'localId') as ObjectId;
  @override
  set localId(ObjectId value) => RealmObjectBase.set(this, 'localId', value);

  @override
  String? get remoteId =>
      RealmObjectBase.get<String>(this, 'remoteId') as String?;
  @override
  set remoteId(String? value) => RealmObjectBase.set(this, 'remoteId', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  bool get done => RealmObjectBase.get<bool>(this, 'done') as bool;
  @override
  set done(bool value) => RealmObjectBase.set(this, 'done', value);

  @override
  Stream<RealmObjectChanges<Task>> get changes =>
      RealmObjectBase.getChanges<Task>(this);

  @override
  Task freeze() => RealmObjectBase.freezeObject<Task>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Task._);
    return const SchemaObject(ObjectType.realmObject, Task, 'Task', [
      SchemaProperty('localId', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('remoteId', RealmPropertyType.string, optional: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('done', RealmPropertyType.bool),
    ]);
  }
}
