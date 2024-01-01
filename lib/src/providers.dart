import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:realm_demo/src/sample_feature/sample_item.dart';
import 'package:realm_demo/src/sample_item_repository.dart';

final sampleItemRepositoryProvider = Provider<SampleItemRepository>(
  (ref) {
    var config = Configuration.local([SampleItem.schema]);
    var realm = Realm(config);
    final RealmResults<SampleItem> items = realm.all<SampleItem>();
    return SampleItemRepository(realm, items);
  },
);
