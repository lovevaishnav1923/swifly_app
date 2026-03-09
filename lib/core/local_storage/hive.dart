import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/cart_item.dart';
import '../widgets/common_logger.dart';

class HiveInitializer {
  static final bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) {
      CommonLogger.warning('🟡 Hive already initialized — skipping');
      return;
    }
    try {

      await Hive.initFlutter();

      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(CartItemAdapter());
        CommonLogger.success('✅ Cart Model Adapter registered');
      }

      if(!Hive.isBoxOpen('productsBox')){
        await Hive.openBox('productsBox');
        CommonLogger.success('📦 messagesBox opened');
      }
      
      if(!Hive.isBoxOpen('cartBox')){
        await Hive.openBox<CartItem>('cartBox');
        CommonLogger.success('📦 cart box opened');
      }

      
    } catch (e) {

    }
  }
}
