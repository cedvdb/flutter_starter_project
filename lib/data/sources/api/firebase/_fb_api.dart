import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:eureka_app/data/models/_entity.dart';

import '../api.dart';

final fs = FirebaseFirestore.instance;

abstract class FbAPI<T extends Entity> extends API<T> {
  final String collection;

  FbAPI({this.collection});

  @override
  Stream<T> watchOne(String id) {
    return fs.collection(collection).doc(id).snapshots().map(docToModel);
  }

  @override
  update(T t) {
    return fs.collection(collection).doc(t.id).update(JsonMapper.serialize(t));
  }

  @override
  Future<T> create(T t) {
    return fs.collection(collection).doc(t.id).set(JsonMapper.serialize(t));
  }

  @override
  Future<void> delete(T t) {
    return fs.collection(collection).doc(t.id).delete();
  }

  /// helper to convert a document snapshot to a map like a map we'd receive
  /// after json decoding a normal API
  Map<String, dynamic> docToMap(DocumentSnapshot doc) {
    Map<String, dynamic> map = Map();
    final data = doc.data();

    if (data == null) return null;

    map['id'] = doc.id;
    data.entries.forEach((entry) {
      var value = entry.value;
      // if the value is a google timestamp we convert it to a datetime
      value = value.runtimeType is Timestamp ? value.toDate() : value;
      map[entry.key] = entry.value;
    });
    return map;
  }

  T docToModel(DocumentSnapshot doc) {
    return JsonMapper.deserialize<T>(docToMap(doc));
  }

  List<T> snapshotToModelList(QuerySnapshot snap) {
    return snap.docs.map((doc) => docToModel(doc)).toList();
  }
}
