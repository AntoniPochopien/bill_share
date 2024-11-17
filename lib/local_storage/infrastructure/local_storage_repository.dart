import 'dart:ui';

import 'package:hive_flutter/adapters.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';

enum _Tables {
  locale,
}

class LocalStorageRepository implements ILocalStorageRepository {
  late final Box box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('SplitMoney');
  }

  @override
  Locale? readLocale() {
    final langCode = box.get(_Tables.locale.name);
    if (langCode != null) {
      return Locale(langCode);
    } else {
      return null;
    }
  }

  @override
  Future<void> saveLocale(Locale? locale) =>
      box.put(_Tables.locale.name, locale?.languageCode);
}
