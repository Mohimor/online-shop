import 'categori_detail.dart';

class ShopingBasketdata {
  // استفاده از late برای اطمینان از مقداردهی قبل از استفاده
  static late final ShopingBasketdata _instance = ShopingBasketdata._internal();

  late List<ItemDetail> _basketItem;

  // سازنده خصوصی برای الگوی Singleton
  ShopingBasketdata._internal() {
    _basketItem = [];
  }

  // سازنده کارخانه برای برگرداندن نمونه Singleton
  factory ShopingBasketdata() {
    return _instance;
  }

  List<ItemDetail> get basketItem => _basketItem;

  set basketItem(List<ItemDetail> value) {
    _basketItem = value;
  }

  // متدهای برای افزودن و حذف آیتم‌ها
  void addItem(ItemDetail item) {
    _basketItem.add(item);
  }

  void removeItem(ItemDetail item) {
    _basketItem.remove(item);
  }
}
