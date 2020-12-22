import '../api/api.dart';

abstract class BaseRepository<Type> {
  API _api;
  set api(API api) {
    _api = api;
  }

  Stream<Type> findOne(String id) {
    return _api.watchOne(id);
  }

  Future<Type> update(Type t) {
    return _api.update(t);
  }

  Future<Type> create(Type t) {
    return _api.create(t);
  }

  Future<void> delete(Type t) {
    return _api.delete(t);
  }
}
