

import 'package:hive/hive.dart';
import '../../core/stateManagement/provider.dart';
import '../../core/widgets/common_logger.dart';
import '../../data/models/cart_item.dart';

class CartViewModel extends BaseProvider {

  CartViewModel(){
    init();
  }

  /// VARIABLES
  List<CartItem> cartItems = [];
  late Box<CartItem> cartBox;

  bool isLoading = false;


  /// ================= INITIALIZE CART VIEW MODEL =================
    Future<void> init() async {
    cartBox = await Hive.openBox<CartItem>('cartBox');
    cartItems = cartBox.values.toList();
    setBusy(true);
  }


  /// ================= TOTAL PRICE =================

  double  get totalPrice {
    try {
      CommonLogger.info("Calculating total price");
      return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    } catch (e) {
      CommonLogger.warning("Error while calculating total price: $e");
      return 0;
    }
  }


  /// ================= ADD TO CART =================

  Future<void> addToCart(CartItem item) async {
    try {
      setBusy(true);
      isLoading = true;

      CommonLogger.info("Adding item to cart: ${item.id}");

      final index = cartItems.indexWhere((i) => i.id == item.id);

      if (index != -1) {
        cartItems[index].quantity += item.quantity;
        CommonLogger.success("Item quantity updated");
      } else {
        cartItems.add(item);
        CommonLogger.success("Item added to cart");
      }

      await saveCart();
    } catch (e) {
      CommonLogger.warning("Error while adding to cart: $e");
    } finally {
      isLoading = false;
      setBusy(false);
    }
  }

  /// ================= REMOVE FROM CART =================

  Future<void> removeFromCart(int id) async {
    try {
      setBusy(true);
      isLoading = true;

      CommonLogger.info("Removing item from cart: $id");

      cartItems.removeWhere((item) => item.id == id);

      await saveCart();

      CommonLogger.success("Item removed successfully");
    } catch (e) {
      CommonLogger.warning("Error while removing from cart: $e");
    } finally {
      isLoading = false;
      setBusy(false);
    }
  }

  /// ================= SAVE CART =================

  Future<void> saveCart() async {
    try {
      CommonLogger.info("Saving cart to local storage");

      await cartBox.clear();

      for (var item in cartItems) {
        await cartBox.put(item.id, item);
      }

      CommonLogger.success("Cart saved successfully");
    } catch (e) {
      CommonLogger.warning("Error while saving cart: $e");
    }
  }

  /// ================= INCREASE QUANTITY =================

  Future<void> increaseQuantity(int id) async {
    try {
      setBusy(true);
      isLoading = true;

      CommonLogger.info("Increasing quantity for item: $id");

      final index = cartItems.indexWhere((item) => item.id == id);

      if (index != -1) {
        cartItems[index].quantity += 1;
        await saveCart();
        CommonLogger.success("Quantity increased");
      }
    } catch (e) {
      CommonLogger.warning("Error while increasing quantity: $e");
    } finally {
      isLoading = false;
      setBusy(false);
    }
  }

  /// ================= DECREASE QUANTITY =================

  Future<void> decreaseQuantity(int id) async {
    try {
      setBusy(true);
      isLoading = true;

      CommonLogger.info("Decreasing quantity for item: $id");

      final index = cartItems.indexWhere((item) => item.id == id);

      if (index != -1 && cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
        await saveCart();
        CommonLogger.success("Quantity decreased");
      } else if (index != -1 && cartItems[index].quantity == 1) {
        await removeFromCart(id);
      }
    } catch (e) {
      CommonLogger.warning("Error while decreasing quantity: $e");
    } finally {
      isLoading = false;
      setBusy(false);
    }
  }

  /// ================= CLEAR CART =================

  Future<void> clearCart() async {
    try {
      setBusy(true);
      isLoading = true;

      CommonLogger.info("Clearing cart");

      cartItems.clear();
      await cartBox.clear();

      CommonLogger.success("Cart cleared successfully");
    } catch (e) {
      CommonLogger.warning("Error while clearing cart: $e");
    } finally {
      isLoading = false;
      setBusy(false);
    }
  }
}