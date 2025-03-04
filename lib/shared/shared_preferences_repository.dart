import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_beautiful_checklist_exercise/shared/database_repository.dart';

class SharedPreferencesRepository implements DatabaseRepository {
  late final SharedPreferences preferences;

  List<String> _items = [];
  static const String _key = "items";

  SharedPreferencesRepository() {
    init();
  }

  // one-time only init instance
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
    _items = preferences.getStringList(_key) ?? [];
  }

  @override
  Future<int> get itemCount async {
    return _items.length;
  }

// create
  @override
  Future<void> addItem(String item) async {
    //make sure item doesn't exist yet and is not empty
    if (item.isNotEmpty && !_items.contains(item)) {
      _items.add(item);
      preferences.setStringList(_key, _items);
    }
  }

// read
  @override
  Future<List<String>> getItems() async {
    return _items;
  }

// update
  @override
  Future<void> editItem(int index, String newItem) async {
    // make sure not empty and not same as other
    if (newItem.isNotEmpty && !_items.contains(newItem)) {
      _items[index] = newItem;
      preferences.setStringList(_key, _items);
    }
  }

// delete
  @override
  Future<void> deleteItem(int index) async {
    _items.removeAt(index);
    preferences.setStringList(_key, _items);
  }
}
