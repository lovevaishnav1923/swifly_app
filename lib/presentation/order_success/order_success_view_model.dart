import 'dart:async';
import 'package:flutter/material.dart';

import '../../core/stateManagement/provider.dart';

class OrderSuccessViewModel extends BaseProvider {

  late AnimationController controller;
  late Animation<double> circleScale;
  late Animation<double> checkOpacity;

  bool showDetails = false;

  void init(TickerProvider vsync) {

    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1200),
    );

    circleScale = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut),
    );

    checkOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.5, 1.0)),
    );

    controller.forward();

    Timer(const Duration(milliseconds: 1300), () {
      showDetails = true;
      notifyListeners();
    });
  }

  void disposeController() {
    controller.dispose();
  }

  String get orderId {
    return "#ORD${DateTime.now().millisecondsSinceEpoch % 100000}";
  }

  String get deliveryDate {
    return "02 Nov 2025";
  }

}