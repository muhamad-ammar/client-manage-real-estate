import 'package:flutter/material.dart';

class BaseViewModel with ChangeNotifier {
  String? _displayMsg;
  String? get displayMsg => _displayMsg;

  UiState _uiState = UiState.none;
  UiState get uiState => _uiState;

  bool _loading = false;
  bool get loading => _loading == true || _uiState == UiState.loading;

  setDisplayMsg(String? msg) {
    _displayMsg = msg;
    notifyListeners();
  }

  setUiState(UiState state) {
    _uiState = state;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  @protected
  void resetObservers() {
    setDisplayMsg(null);
    setUiState(UiState.none);
    setLoading(false);
    notifyListeners();
  }
}

enum UiState { none, loading, completed, error, empty, noInternet, notSignedIn }
