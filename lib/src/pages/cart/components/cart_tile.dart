import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/common_widgets/quantity_widgets.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;
  final UtilsServices utilsServices = UtilsServices();

  //const CartTile({super.key});
  CartTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      /* Aumentar espaçamento entre os cards com margin */
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        // imagem
        leading: Image.asset(
          cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        // Titulo
        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Quantidade
        trailing: QuantityWidget(
          suffixText: cartItem.item.unit,
          value: cartItem.quantity,
          result: (quantity) {},
        ),
      ),
    );
  }
}
