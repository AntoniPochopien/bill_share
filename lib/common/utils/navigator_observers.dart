import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/utils/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<NavigatorObserver> navigatorObservers() {
  final observers = <NavigatorObserver>[
    AutoRouteObserver(),
  ];
  if (!kDebugMode) {
    observers.add(firebaseAnalyticsObserver);
  }
  return observers;
}
