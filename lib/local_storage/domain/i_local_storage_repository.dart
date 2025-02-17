import 'package:flutter/material.dart';

abstract class ILocalStorageRepository {
  Future<void> init();
  Locale? readLocale();
  Future<void> saveLocale(Locale? locale);
  int? readLastGroupId();
  Future<void> saveLastGroupId(int? groupId);
}
