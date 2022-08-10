

import 'package:flutter/material.dart';
import 'package:sausage_api/sausage_api.dart';

// Business Logic goes here
class SausageProvider extends ChangeNotifier {

  final SausageAPI _api;
  late GreggsModel _sausage;
  List <GreggsModel> _basket = [];
  double _basketTotal = 0;
  SausageProvider(SausageAPI api) : _api = api;

  /// Lets load up our sausage data
  Future <void> init() async {
    _sausage = await _api.getSausage();
    notifyListeners();
  }

  // get the sausage data
  GreggsModel get sausage {
    return _sausage;
  }

  /// Empty the content of the basket
  void emptyBasket(){
    _basket = [];
    notifyListeners();
  }

  /// Total the current basket
  String  get basketTotal {
    double total = 0;
    for (var element in _basket) {
      total += element.eatOutPrice;
    }
    return total.toStringAsFixed(2);
  }


  /// Add an item to the Basket
  void addItemToBasket(GreggsModel item){
    _basket.add(item);
    notifyListeners();
  }

  /// Get the content of the current basket
  List<GreggsModel> get currentBasket {
    return _basket;
  }

}