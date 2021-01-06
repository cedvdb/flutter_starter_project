import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:eureka_app/data/models/_entity.dart';

import '../api.dart';
import 'package:rxdart/rxdart.dart';

final fs = FirebaseFirestore.instance;

abstract class FbAPI<T extends Entity> extends API<T> {
  final String collection;

  FbAPI({this.collection});

  @override
  Stream<T> watchOne(String id) {
    return fs
        .collection(collection)
        .doc(id)
        .snapshots()
        .map(docToModel)
        .shareReplay(maxSize: 1);
  }

  @override
  update(T t) async {
    final asMap = JsonMapper.toMap(t);
    final doc = fs.collection(collection).doc(t.id);
    await doc.update(asMap);
    final updatedDoc = await doc.get(GetOptions(source: Source.cache));
    return docToModel(updatedDoc);
  }

  @override
  Future<T> create(T t) async {
    final asMap = JsonMapper.toMap(t);
    final doc = await fs.collection(collection).add(asMap);
    return t.copyWith(id: doc.id);
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
      if (value is Timestamp) {
        value = value.toDate();
      }
      // print('value $value type ${value.runtimeType}');
      map[entry.key] = value;
    });
    return map;
  }

  T docToModel(DocumentSnapshot doc) {
    if (doc.exists)
      return JsonMapper.deserialize<T>(docToMap(doc));
    else
      return null;
  }

  List<T> snapshotToModelList(QuerySnapshot snap) {
    return snap.docs.map((doc) => docToModel(doc)).toList();
  }
}
