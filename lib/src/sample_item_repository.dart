import 'package:realm/realm.dart';
import 'package:realm_demo/src/sample_feature/sample_item.dart';

class SampleItemRepository {
  final RealmResults<SampleItem> items;
  final Realm _realm;
  SampleItemRepository(
    this._realm,
    this.items,
  );

  void addNewItem() {
    _realm.write(
      () => _realm.add(
        SampleItem(ObjectId(), 1 + (items.lastOrNull?.no ?? 0)),
      ),
    );
  }

  RealmResults<SampleItem> readAllItems() {
    return _realm.all<SampleItem>();
  }

  void deleteItem(String id) {
    _realm.write(() {
      final item = _realm.find<SampleItem>(id);
      if (item != null) {
        _realm.delete(item);
      }
    });
  }

  void updateItem() {
    _realm.write(
      () => _realm.add(
        SampleItem(ObjectId(), items.last.no + 1),
        update: true,
      ),
    );
  }
}
