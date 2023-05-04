import 'package:greengrocer/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    required this.quantity,
  });

  // Pegar o valor total do carrinho
  double totalPrice() => item.price * quantity;
}
