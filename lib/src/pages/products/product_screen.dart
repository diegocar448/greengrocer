import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/base/controller/navigation_controller.dart';
import 'package:greengrocer/src/pages/common_widgets/quantity_widgets.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ProductScreen extends StatefulWidget {
  //const ProductScreen({super.key});
  const ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // Conteúdo
          Column(
            children: [
              Expanded(
                /* Aqui adicionamos a nossa animação Hero */
                child: Hero(
                  tag: widget.item.imgUrl,
                  //child: Image.asset(widget.item.imgUrl),
                  child: Image.network(widget.item.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Conteúdo
                      Column(
                        /* esticar ao maximo com o strech */
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Nome - Quantidade
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.item.itemName,
                                  maxLines: 2,
                                  /* Adicionar ... no final do texto quando o texto ultrapassar o limite de duas linha */
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              /* widgets de quantidade */
                              QuantityWidget(
                                suffixText: widget.item.unit,
                                value: cartItemQuantity,
                                result: (quantity) {
                                  setState(() {
                                    cartItemQuantity = quantity;
                                  });
                                },
                              ),
                            ],
                          ),

                          // Preço
                          Text(utilsServices.priceToCurrency(widget.item.price),
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.customSwatchColor,
                              )),

                          // Descrição
                          Expanded(
                            /* usamos o SingleChildScrollView para permitir a rolagem do nosso Text */
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SingleChildScrollView(
                                child: Text(
                                  widget.item.description,
                                  style: const TextStyle(
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Botão
                          SizedBox(
                            height: 55,
                            /* botão com icone e text */
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                //Fechar
                                Get.back();

                                // Carrinho
                                navigationController
                                    .navigatePageView(NavigationTabs.cart);
                              },
                              label: const Text(
                                'Add no carrinho',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: const Icon(Icons.shopping_cart_outlined),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
