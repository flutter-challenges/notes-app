import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? argument}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushNamedRemoveUntil(
    String routeName,
    RoutePredicate predicate, {
    Object? argument,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: argument);
  }

  void pop() => Navigator.of(this).pop();
}