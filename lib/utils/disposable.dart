import 'dart:async';

mixin Disposable on Object {
  final StreamController _close$ = StreamController();

  get closed$ => _close$.stream;

  void dispose() {
    _close$.close();
  }
}
