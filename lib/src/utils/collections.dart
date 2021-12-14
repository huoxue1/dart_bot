abstract class Collection<T, V> {
  V load(T key);
  bool delete(T key);
  bool store(T key, void Function(V) f);
  V loadAndDelete(T key);
}

class Collections {}
