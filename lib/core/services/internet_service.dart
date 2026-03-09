import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetService {

  final _checker = InternetConnection();
  final _connectivity = Connectivity();
  final _controller = StreamController<bool>.broadcast();

  Stream<bool> get connectionStatus => _controller.stream;

  Future<void> initialize() async {
    final initialStatus = await isConnected();
    _controller.add(initialStatus);

    _connectivity.onConnectivityChanged.listen((_) async {
      final status = await isConnected();
      _controller.add(status);
    });

    _checker.onStatusChange.listen((status) async {
      final isConnected = status == InternetStatus.connected;
      _controller.add(isConnected);
    });
  }

  Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    try {
      final hasInternet = await _checker.hasInternetAccess;
      return hasInternet;
    } catch (_) {
      return false;
    }
  }

  void dispose() {
    _controller.close();
  }
}
