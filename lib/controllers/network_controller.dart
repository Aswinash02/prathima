import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;
  Rx<ConnectivityResult> connectivityStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _subscription = _connectivity.onConnectivityChanged.listen(_updateStatus);
  }

  Future<void> _initConnectivity() async {
    try {
      ConnectivityResult result = await _connectivity.checkConnectivity();
      _updateStatus(result);
    } catch (e) {
      print("Error checking connectivity: $e");
    }
  }

  void _updateStatus(ConnectivityResult result) {
    connectivityStatus.value = result;
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
