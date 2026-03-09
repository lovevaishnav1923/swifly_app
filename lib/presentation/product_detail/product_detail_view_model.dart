import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../core/stateManagement/provider.dart';
import '../../data/models/cart_item.dart';
import '../cart/cart_view_model.dart';

class ProductDetailViewModel extends BaseProvider {
  ProductDetailViewModel(this.cartViewModel);

  final CartViewModel cartViewModel;

  ///------------------------- text visibility function ------------------------- ///

  bool isExpanded = false;

  void changeTextVisibility(){
    isExpanded = !isExpanded;
    notifyListeners();
  }

  ///------------------------- cart function ------------------------- ///


  bool productAlreadyInCart = false;

  void isProductInCart(int id) {
    productAlreadyInCart =
        cartViewModel.cartItems.any((item) => item.id == id);

    setBusy(true);
  }

  void addToCart(CartItem cartItem) {
    cartViewModel.addToCart(cartItem);
    productAlreadyInCart = true;
    setBusy(true);
  }

  ///------------------------- tabs logic ------------------------- ///

  final PageController pageController = PageController();

  int currentTabIndex = 0;

  final List<String> tabs = [
    AppStrings.description,
    AppStrings.reviews

  ];

  void changeTab(int index) {
    currentTabIndex = index;

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    notifyListeners();
  }

  void onPageChanged(int index) {
    currentTabIndex = index;
    notifyListeners();
  }
}
