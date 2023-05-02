import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ProductScreen extends StatelessWidget {
  //const ProductScreen({super.key});
  ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;
  final UtilsServices utilsServices = UtilsServices();

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
                  tag: item.imgUrl,
                  child: Image.asset(item.imgUrl),
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
                        offset: Offset(0, 2),
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
                                  item.itemName,
                                  maxLines: 2,
                                  /* Adicionar ... no final do texto quando o texto ultrapassar o limite de duas linha */
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 70,
                                color: Colors.red,
                              )
                            ],
                          ),

                          // Preço
                          Text(utilsServices.priceToCurrency(item.price),
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
                                  item.description,
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
                              onPressed: () {},
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
