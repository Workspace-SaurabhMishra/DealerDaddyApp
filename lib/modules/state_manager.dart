class Manager{
  final Map<dynamic,dynamic> _store = <dynamic,dynamic>{};

  static Manager instance = Manager._();
  Manager._();

  /// setter for store.
  set(dynamic key,dynamic value) => _store[key] = value;

  /// getter for store.
  get(dynamic key) => _store[key];
}

Manager store = Manager.instance;