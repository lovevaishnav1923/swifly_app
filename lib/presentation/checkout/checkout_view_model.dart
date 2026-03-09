import '../../core/stateManagement/provider.dart';
import '../cart/cart_view_model.dart';

class CheckoutViewModel extends BaseProvider {

  final CartViewModel cartViewModel;

  CheckoutViewModel({required this.cartViewModel});

  /// SUBTOTAL
  double get subtotal => cartViewModel.totalPrice;

  /// DISCOUNT (25%)
  double get discount => subtotal * 0.25;

  /// SHIPPING
  double get shipping => 5;

  /// TAX (5%)
  double get tax => subtotal * 0.05;

  /// FINAL TOTAL
  double get total => subtotal - discount + shipping + tax;
}