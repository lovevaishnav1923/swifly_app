


import 'package:flutter/cupertino.dart';

import '../../core/stateManagement/provider.dart';
import '../../core/widgets/common_logger.dart';
import '../../domain/entities/product_entity.dart';

class SearchViewModel extends BaseProvider {

  /// variables
  List<ProductEntity> allProducts = [];
  List<ProductEntity> searchResults = [];
  final TextEditingController searchController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();

  /// functions

  // to set the products coming from the home view
  void setProducts(List<ProductEntity> products) {
    allProducts = products;
    searchResults = [];
    notifyListeners();
  }
  //-----------------xxx------------------//


  // to clear the search
  void clearSearch() {
    searchController.text ='';
    searchResults.clear();
    notifyListeners();
  }
  //-----------------xxx------------------//



  // search function
  void search(String searchQuery) {
    try {
      searchResults = List.from(allProducts);
      if (searchQuery.isNotEmpty) {
        searchResults = searchResults.where((p) =>
        p.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            p.category.toLowerCase().contains(searchQuery.toLowerCase())
        ).toList();
        notifyListeners();
      }
    } catch (e, stackTrace) {
      CommonLogger.error("Error while applying search and filters", stackTrace, e);
    }
  }
//-----------------xxx------------------//


}